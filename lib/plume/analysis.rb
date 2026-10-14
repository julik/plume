# frozen_string_literal: true

module Plume
	# Static analysis on top of the AST. The first question it answers is "which tables and
	# columns would this statement read?", see `Plume.reads`.
	module Analysis
		autoload :Resolver, "plume/analysis/resolver"

		# A read of one column, or of a table as a whole when `column` is nil - which is what
		# `SELECT count(*) FROM t` amounts to. `usage` is `:projected` when the value can flow
		# into the result rows and `:referenced` when it is only used to filter, join, sort or group
		Reference = Data.define(:schema, :table, :column, :usage, :node) do
			def table_key = Analysis.table_key(schema, table)
		end

		Unresolved = Data.define(:name, :reason, :node) do
			def message
				excerpt = Analysis.excerpt(node)
				excerpt ? "#{reason}: #{name}\n#{excerpt}" : "#{reason}: #{name}"
			end
		end

		# The source line `node` sits on with a caret under it, for error messages
		def self.excerpt(node)
			loc = node&.location
			src = node&.full_source&.b # locations are byte offsets
			return unless loc && src

			line_start = src.rindex("\n", [loc[0] - 1, 0].max)&.+(1) || 0
			line_end = src.index("\n", loc[0]) || src.bytesize
			line = src.byteslice(line_start, line_end - line_start).force_encoding(Encoding::UTF_8)
			caret = (" " * (loc[0] - line_start)) + ("^" * [loc[1] - loc[0], 1].max)
			"  #{line}\n  #{caret}"
		end

		class Error < StandardError
			attr_reader :unresolved

			def initialize(message = nil, unresolved: [])
				@unresolved = unresolved
				super(message || unresolved.map(&:message).join("\n"))
			end
		end

		# Tables in the main schema are keyed by their bare name, any other schema
		# (temp, attached databases) is spelled out as "schema.table"
		def self.table_key(schema, table)
			(schema.nil? || schema.casecmp?("main")) ? table : "#{schema}.#{table}"
		end

		class Reads
			attr_reader :statement, :references, :unresolved, :views, :functions

			def initialize(statement)
				@statement = statement
				@references = []
				@unresolved = []
				@views = Set.new
				@functions = Set.new
			end

			# Every base table the statement touches, including ones read only as a whole
			def tables = @references.to_set(&:table_key)

			# `{ "table" => Set["column", …] }`, optionally narrowed to one usage
			def columns(usage = nil)
				@references.each_with_object({}) do |ref, acc|
					next if ref.column.nil? || (usage && ref.usage != usage)

					(acc[ref.table_key] ||= Set.new) << ref.column
				end
			end

			def projected = columns(:projected)
			def referenced = columns(:referenced)

			def resolved? = @unresolved.empty?

			def inspect
				"#<#{self.class.name} columns=#{columns.transform_values(&:to_a).inspect} unresolved=#{@unresolved.size}>"
			end
		end
	end

	module Analysis
		# Which tables and columns `sql` - a single SELECT - would read.
		#
		# Without a catalog, columns of tables cannot be enumerated: `SELECT *` comes back as a read
		# of the column "*", and an unqualified column with more than one table in scope is ambiguous.
		#
		# With `strict: true` (the default) anything that cannot be attributed raises
		# `Plume::Analysis::Error`; with `strict: false` it is listed in `Reads#unresolved` instead.
		def self.reads(sql, catalog: nil, strict: true)
			statements = Parser.new(sql).parse
			raise Error, "expected exactly one statement, got #{statements.size}" unless statements.size == 1

			statement = statements.first
			unless SelectStatement === statement
				raise Error, "only SELECT statements can be analyzed for reads, got #{statement.class.name}"
			end

			reads = Resolver.new(catalog:).reads(statement)
			raise Error.new(unresolved: reads.unresolved) if strict && !reads.resolved?

			reads
		end
	end
end
