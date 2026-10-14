# frozen_string_literal: true

module Plume
	module Analysis
		# Walks a SELECT, works out what every table and column reference points at, and records
		# the reads of base tables. Views and CTEs are looked through: their bodies are analyzed
		# once they are referenced, and everything those bodies read counts as read - whether or
		# not the outer query ends up using it. That matches what SQLite's authorizer reports.
		class Resolver
			# One entry in a FROM clause.
			#   kind :table   - a base table, reads are recorded against it
			#        :derived - CTE, view or subquery, its body has been analyzed already
			#        :function - table-valued function, nothing to record
			#        :group   - an aliased `(a JOIN b) AS x`, columns live in `members`
			# `columns` is nil when we cannot know them (no catalog, unknown function)
			Source = Struct.new(:name, :kind, :schema, :table, :columns, :members, :merged, :node, keyword_init: true) do
				def matches?(qualifier, schema_qualifier)
					return false unless name&.casecmp?(qualifier)
					return true unless schema_qualifier

					self.schema&.casecmp?(schema_qualifier) || (self.schema.nil? && schema_qualifier.casecmp?("main"))
				end

				def column(name)
					return unless columns

					needle = name.downcase
					columns.find { |c| c&.downcase == needle } || table&.hidden_columns&.find { |c| c.downcase == needle }
				end
			end

			Scope = Struct.new(:sources, :parent, :ctes, :aliases, keyword_init: true) do
				def each_up
					scope = self
					while scope
						yield scope
						scope = scope.parent
					end
				end
			end

			Cte = Struct.new(:node, :scope, :analyzed, :columns, :in_progress, keyword_init: true)

			# The columns of json_each and json_tree are fixed, see https://www.sqlite.org/json1.html#jeach
			JSON_TABLE_COLUMNS = %w[key value type atom id parent fullkey path json root].freeze
			FUNCTION_COLUMNS = {
				"json_each" => JSON_TABLE_COLUMNS,
				"json_tree" => JSON_TABLE_COLUMNS,
				"jsonb_each" => JSON_TABLE_COLUMNS,
				"jsonb_tree" => JSON_TABLE_COLUMNS,
				"generate_series" => %w[value start stop step],
			}.freeze

			def initialize(catalog: nil)
				@catalog = catalog
			end

			def reads(statement)
				@reads = Reads.new(statement)
				select(statement, parent: nil, usage: :projected)
				@reads
			end

			# Names of the columns a select produces, nil for the ones we cannot name
			def output_columns(statement)
				@reads = Reads.new(statement)
				select(statement, parent: nil, usage: :projected) || []
			end

			private

			def select(statement, parent:, usage:)
				scope = Scope.new(sources: [], parent:, ctes: {})
				statement.with_clause&.ctes&.each do |cte|
					scope.ctes[cte.name.downcase] = Cte.new(node: cte, scope:, analyzed: Set.new)
				end

				names = nil
				core_scope = nil
				statement.cores.each do |core|
					core_names, core_scope = select_core(core, parent: scope, usage:)
					names ||= core_names
				end

				# ORDER BY of a compound can only name result columns, which reads nothing new
				if statement.cores.size == 1 && core_scope
					statement.orderings&.each do |term|
						expression(term.expression, core_scope, :referenced, aliases: :first)
					end
				end
				expression(statement.limit, scope, :referenced)
				expression(statement.offset, scope, :referenced)

				names
			end

			def select_core(core, parent:, usage:)
				scope = Scope.new(sources: [], parent:, ctes: {}, aliases: {})

				if ValuesClause === core
					core.rows.each { |row| row.values.each { |v| expression(v, scope, usage) } }
					width = core.rows.first.values.size
					return [Array.new(width) { |i| "column#{i + 1}" }, scope]
				end

				add_source(core.source, scope, usage) if core.source

				core.columns.each do |column|
					scope.aliases[column.alias.downcase] = column.result if ResultColumn === column && column.alias
				end

				names = []
				core.columns.each do |column|
					if StarResultColumn === column
						expanded = star(column, scope, usage)
						expanded ? names.concat(expanded) : names << nil
					else
						expression(column.result, scope, usage)
						names << output_name(column)
					end
				end

				expression(core.condition, scope, :referenced, aliases: :fallback)
				core.groupings&.each { |g| expression(g, scope, :referenced, aliases: :fallback) }
				expression(core.having, scope, :referenced, aliases: :fallback)
				core.windows&.each do |window|
					window.partitions&.each { |p| expression(p, scope, :referenced) }
					window.orderings&.each { |o| expression(o.expression, scope, :referenced) }
				end

				[names, scope]
			end

			def output_name(column)
				return column.alias if column.alias

				case (result = column.result)
				when ColumnName then result.column
				when Node then result.source_text
				end
			end

			# -- FROM

			def add_source(source, scope, usage)
				case source
				when JoinClause
					add_source(source.left, scope, usage)
					source.joins.each do |join|
						left_sources = scope.sources.dup
						add_source(join.source, scope, usage)
						join_constraint(join, left_sources, scope.sources.last, scope)
					end
				when TableName then add_table_source(source, scope, usage)
				when TableFunction
					source.arguments&.each { |a| expression(a, scope, :referenced) }
					@reads.functions << source.function.downcase
					scope.sources << Source.new(
						name: source.alias || source.function, kind: :function,
						columns: FUNCTION_COLUMNS[source.function.downcase], node: source,
					)
				when SubquerySource
					# A FROM subquery sees the enclosing queries, but not its siblings in this FROM
					names = select(source.select, parent: scope.parent, usage:)
					scope.sources << Source.new(name: source.alias, kind: :derived, columns: names, node: source)
				when ParentheticalSource
					if source.alias
						inner = Scope.new(sources: [], parent: scope.parent, ctes: {})
						add_source(source.source, inner, usage)
						scope.sources << Source.new(name: source.alias, kind: :group, members: inner.sources, node: source)
					else
						add_source(source.source, scope, usage)
					end
				end
			end

			def add_table_source(source, scope, usage)
				name = source.alias || source.table

				if source.schema.nil? && (cte = find_cte(source.table, scope))
					columns = analyze_cte(cte, usage)
					scope.sources << Source.new(name:, kind: :derived, columns:, node: source)
				elsif @catalog.nil?
					record(source.schema, source.table, nil, usage, source)
					scope.sources << Source.new(name:, kind: :table, schema: source.schema, table: nil, node: source)
				elsif (table = @catalog.table(source.table, schema: source.schema))
					record(table.schema, table.name, nil, usage, source)
					scope.sources << Source.new(name:, kind: :table, schema: table.schema, table:, columns: table.columns, node: source)
				elsif (view = @catalog.view(source.table, schema: source.schema))
					@reads.views << Analysis.table_key(view.schema, view.name)
					names = Resolver.new(catalog: @catalog).send(:analyze_view, view, usage, @reads)
					scope.sources << Source.new(name:, kind: :derived, columns: view.columns || names, node: source)
				else
					unresolved(source.table, "no such table", source)
					scope.sources << Source.new(name:, kind: :table, schema: source.schema, node: source)
				end
			end

			# Views are analyzed in a fresh resolver so the CTEs of the query using the view are not
			# visible inside it, but the reads land in the same bag
			def analyze_view(view, usage, reads)
				@reads = reads
				select(view.select, parent: nil, usage:)
			end

			def find_cte(name, scope)
				needle = name.downcase
				scope.each_up do |s|
					return s.ctes[needle] if s.ctes&.key?(needle)
				end
				nil
			end

			def analyze_cte(cte, usage)
				declared = cte.node.column_names
				# A recursive CTE refers to itself, we know its columns at best from the declaration
				return declared || cte.columns if cte.in_progress
				return declared || cte.columns if cte.analyzed.include?(usage)

				cte.in_progress = true
				names = select(cte.node.select, parent: cte.scope, usage:)
				cte.in_progress = false
				cte.analyzed << usage
				cte.columns = names
				declared || names
			end

			def join_constraint(join, left_sources, right, scope)
				shared =
					case join.constraint
					when JoinUsingConstraint then join.constraint.column_names
					else
						if join.operator.natural
							if right.columns.nil? || left_sources.any? { |s| s.columns.nil? }
								unresolved(right.name.to_s, "cannot work out the columns of a NATURAL JOIN without a catalog", join)
								[]
							else
								right.columns.select { |c| left_sources.any? { |s| s.column(c) } }
							end
						else
							expression(join.constraint.expression, scope, :referenced) if JoinOnConstraint === join.constraint
							[]
						end
					end

				# Both sides of USING and NATURAL are compared, even though SQLite's authorizer
				# does not report the right-hand one
				shared.each do |column|
					left = left_sources.find { |s| s.column(column) } || left_sources.find { |s| s.columns.nil? }
					read_through(left, column, :referenced, join) if left
					read_through(right, column, :referenced, join)
					(right.merged ||= Set.new) << column.downcase
				end
			end

			def star(column, scope, usage)
				sources =
					if column.table
						found = scope.sources.find { |s| s.matches?(column.table, nil) }
						unless found
							unresolved("#{column.table}.*", "no such table", column)
							return nil
						end
						[found]
					else
						scope.sources
					end

				names = []
				sources.each do |source|
					expanded = star_source(source, usage, column, skip_merged: column.table.nil?)
					expanded ? names.concat(expanded) : (return nil)
				end
				names
			end

			def star_source(source, usage, node, skip_merged:)
				case source.kind
				when :group
					source.members.flat_map { |m| star_source(m, usage, node, skip_merged:) || [] }
				when :table
					if source.columns.nil?
						record(source.schema, source.node.table, "*", usage, node)
						nil
					else
						columns = source.columns.reject { |c| skip_merged && source.merged&.include?(c.downcase) }
						columns.each { |c| record(source.table.schema, source.table.name, c, usage, node) }
						columns
					end
				else
					source.columns&.reject { |c| skip_merged && c && source.merged&.include?(c.downcase) }
				end
			end

			# -- expressions

			def expression(node, scope, usage, aliases: :none)
				case node
				when nil, Variable, LiteralExpression then nil
				when ColumnName then column(node, scope, usage, aliases)
				when SelectStatement then select(node, parent: scope, usage:)
				when TableName then whole_table(node, scope)
				when Node then node.children.each { |child| expression(child, scope, usage, aliases:) }
				end
			end

			# `x IN t` compares against the single column of t
			def whole_table(node, scope)
				fake = Scope.new(sources: [], parent: scope, ctes: {})
				add_table_source(node, fake, :referenced)
				source = fake.sources.last
				star_source(source, :referenced, node, skip_merged: false) if source
			end

			def column(node, scope, usage, aliases)
				name = node.column

				if node.table
					scope.each_up do |s|
						source = s.sources.find { |src| src.matches?(node.table, node.schema) }
						return read_through(source, name, usage, node) if source
					end
					return unresolved(qualified_name(node), "no such table: #{node.table}", node)
				end

				return if aliases == :first && scope.aliases&.key?(name.downcase)

				scope.each_up do |s|
					return if resolve_in(s, name, usage, node)
					return if s.equal?(scope) && aliases == :fallback && s.aliases&.key?(name.downcase)
					return if rowid(s, name, usage, node)
				end

				# SQLite reads an unresolvable "double-quoted" identifier as a string literal
				return if node.column_tk_src&.start_with?('"')

				unresolved(name, "no such column", node)
			end

			def resolve_in(scope, name, usage, node)
				known = scope.sources.select { |s| source_has?(s, name) }
				unknown = scope.sources.select { |s| source_unknown?(s) }

				if known.size == 1 && unknown.empty?
					read_through(known.first, name, usage, node)
				elsif known.size > 1 && unknown.empty?
					# A USING/NATURAL column belongs to both sides and is not ambiguous
					merged = known.select { |s| s.merged&.include?(name.downcase) }
					if merged.any?
						read_through((known - merged).first || known.first, name, usage, node)
					else
						unresolved(name, "ambiguous column name", node)
					end
				elsif known.empty? && unknown.size == 1
					read_through(unknown.first, name, usage, node)
				elsif unknown.any? && (known.size + unknown.size) > 1
					unresolved(name, "ambiguous column name without a catalog", node)
				else
					return false
				end
				true
			end

			def source_has?(source, name)
				return source.members.any? { |m| source_has?(m, name) } if source.kind == :group

				!!source.column(name)
			end

			def source_unknown?(source)
				return source.members.any? { |m| source_unknown?(m) } if source.kind == :group

				source.columns.nil?
			end

			def rowid(scope, name, usage, node)
				return false unless Catalog::ROWID_NAMES.include?(name.downcase)

				candidates = scope.sources.select { |s| s.kind == :table && (s.table.nil? || s.table.rowid?) }
				return false unless candidates.size == 1

				read_through(candidates.first, name, usage, node)
				true
			end

			def read_through(source, name, usage, node)
				case source.kind
				when :table
					if source.table
						column = source.column(name)
						column ||= source.table.rowid_alias || "rowid" if Catalog::ROWID_NAMES.include?(name.downcase) && source.table.rowid?
						return unresolved(name, "no such column in #{source.table.name}", node) unless column

						record(source.table.schema, source.table.name, column, usage, node)
					else
						record(source.schema, source.node.table, name, usage, node)
					end
				when :group
					member = source.members.find { |m| source_has?(m, name) } || source.members.find { |m| source_unknown?(m) }
					member ? read_through(member, name, usage, node) : unresolved(name, "no such column", node)
				when :derived, :function
					if source.columns && !source.column(name) && !source.columns.include?(nil)
						unresolved(name, "no such column in #{source.name}", node)
					end
				end
				true
			end

			def record(schema, table, column, usage, node)
				@reads.references << Reference.new(schema:, table:, column:, usage:, node:)
			end

			def unresolved(name, reason, node)
				@reads.unresolved << Unresolved.new(name:, reason:, node:)
				true
			end

			def qualified_name(node) = [node.schema, node.table, node.column].compact.join(".")
		end
	end
end
