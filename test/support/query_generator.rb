# frozen_string_literal: true

# Produces random but valid SELECTs over a catalog, mixing the constructs whose
# name resolution is easy to get wrong: aliases, joins, correlated subqueries,
# CTEs, compounds, stars and result-column aliases used in ORDER BY
class QueryGenerator
	def initialize(catalog, seed:)
		@tables = catalog.tables.reject { |t| t.columns.empty? }
		@random = Random.new(seed)
	end

	def query
		@alias_counter = 0
		case @random.rand(10)
		when 0 then cte_query
		when 1 then "#{simple_select(columns: 1, order: false)} UNION #{simple_select(columns: 1)}"
		else simple_select
		end
	end

	def statement
		@alias_counter = 0
		case @random.rand(6)
		when 0 then insert_select
		when 1 then upsert
		when 2, 3 then update
		else delete
		end
	end

	private

	def insert_select
		target = new_source
		columns = target[:table].columns.sample(2, random: @random)
		source = new_source
		values = Array.new(columns.size) { column_ref(source) }
		"INSERT INTO #{quote(target[:table].name)} (#{columns.map { |c| quote(c) }.join(", ")}) " \
			"SELECT #{values.join(", ")} FROM #{table_ref(source)} WHERE #{condition([source], [source])}"
	end

	# The conflict target has to be a key, so stick to tables whose rowid is an "id" column
	def upsert
		table = @tables.select { |t| t.rowid_alias == "id" }.sample(random: @random)
		name = quote(table.name)
		set = (table.columns - ["id"]).sample(2, random: @random)
		filter = table.columns.sample(random: @random)
		"INSERT INTO #{name} (id) VALUES (?) ON CONFLICT (id) DO UPDATE SET " \
			"#{set.map { |c| "#{quote(c)} = excluded.#{quote(c)}" }.join(", ")} " \
			"WHERE #{name}.#{quote(filter)} IS NOT NULL RETURNING #{quote(table.columns.sample(random: @random))}"
	end

	def update
		target = new_source
		table = target[:table]
		set = table.columns.sample(1 + @random.rand(2), random: @random)
		value = ->(_) { @random.rand(2).zero? ? "?" : "#{quote(table.name)}.#{quote(table.columns.sample(random: @random))}" }
		sql = +"UPDATE #{quote(table.name)} SET #{set.map { |c| "#{quote(c)} = #{value.(c)}" }.join(", ")}"
		if @random.rand(3).zero?
			from = new_source
			sql << " FROM #{table_ref(from)} WHERE #{column_ref(from)} = #{quote(table.name)}.#{quote(table.columns.sample(random: @random))}"
		elsif @random.rand(2).zero?
			inner = new_source
			sql << " WHERE #{quote(table.columns.sample(random: @random))} IN (SELECT #{column_ref(inner)} FROM #{table_ref(inner)})"
		end
		sql << " RETURNING *" if @random.rand(3).zero?
		sql
	end

	def delete
		table = new_source[:table]
		sql = +"DELETE FROM #{quote(table.name)}"
		sql << " WHERE #{quote(table.columns.sample(random: @random))} = ?" if @random.rand(3).nonzero?
		sql << " RETURNING #{quote(table.columns.sample(random: @random))}" if @random.rand(2).zero?
		sql
	end

	def simple_select(columns: nil, order: true, outer: [])
		sources = Array.new(1 + @random.rand(3)) { new_source }
		from = sources.each_with_index.map do |source, i|
			next table_ref(source) if i.zero?

			left = sources[@random.rand(i)]
			case @random.rand(4)
			when 0 then ", #{table_ref(source)}"
			when 1 then " LEFT JOIN #{table_ref(source)} ON #{column_ref(source)} = #{column_ref(left)}"
			when 2 then " JOIN #{table_ref(source)} ON #{column_ref(source)} = #{column_ref(left)}"
			else
				shared = (source[:table].columns & left[:table].columns).first
				shared && sources[0...i].count { |s| s[:table].columns.include?(shared) } == 1 ?
					" JOIN #{table_ref(source)} USING (#{shared})" :
					" CROSS JOIN #{table_ref(source)}"
			end
		end.join

		visible = sources + outer
		aliases = []
		result = if columns
			Array.new(columns) { column_ref(sources.sample(random: @random)) }
		elsif @random.rand(8).zero?
			["*"]
		elsif @random.rand(6).zero?
			["#{sources.first[:alias]}.*"]
		else
			Array.new(1 + @random.rand(3)) { result_column(sources, visible, aliases) }
		end

		sql = +"SELECT #{result.join(", ")} FROM #{from}"
		sql << " WHERE #{condition(sources, visible)}" if @random.rand(2).zero?
		if columns.nil? && @random.rand(4).zero?
			sql << " GROUP BY #{column_ref(sources.first)}"
		end
		if order && @random.rand(3).zero?
			sql << " ORDER BY #{aliases.first || column_ref(sources.first)}"
		end
		sql
	end

	def cte_query
		inner_source = new_source
		names = inner_source[:table].columns.sample(2, random: @random)
		cte = "c#{@random.rand(100)}"
		used = @random.rand(4).nonzero?
		body = "SELECT #{names.map { |n| "#{inner_source[:alias]}.#{quote(n)}" }.join(", ")} FROM #{table_ref(inner_source)}"
		outer = used ? "SELECT #{cte}.#{quote(names.first)} FROM #{cte}" : "SELECT 1"
		"WITH #{cte}(#{names.map { |n| quote(n) }.join(", ")}) AS (#{body}) #{outer}"
	end

	def result_column(sources, visible, aliases)
		case @random.rand(6)
		when 0 then "count(*)"
		when 1 then "(SELECT max(#{column_ref(inner = new_source)}) FROM #{table_ref(inner)} WHERE #{column_ref(inner)} = #{column_ref(visible.sample(random: @random))})"
		when 2
			aliases << "r#{aliases.size}"
			"#{column_ref(sources.sample(random: @random))} AS #{aliases.last}"
		else column_ref(sources.sample(random: @random))
		end
	end

	def condition(sources, visible)
		case @random.rand(5)
		when 0
			inner = new_source
			"EXISTS (SELECT 1 FROM #{table_ref(inner)} WHERE #{column_ref(inner)} = #{column_ref(visible.sample(random: @random))})"
		when 1
			inner = new_source
			"#{column_ref(sources.sample(random: @random))} IN (SELECT #{column_ref(inner)} FROM #{table_ref(inner)})"
		when 2 then "#{column_ref(sources.sample(random: @random))} IS NOT NULL AND #{column_ref(sources.sample(random: @random))} > ?"
		else "#{column_ref(sources.sample(random: @random))} = ?"
		end
	end

	def new_source
		@alias_counter += 1
		{ table: @tables.sample(random: @random), alias: "t#{@alias_counter}" }
	end

	def table_ref(source) = "#{quote(source[:table].name)} AS #{source[:alias]}"

	def column_ref(source)
		column = source[:table].columns.sample(random: @random)
		@random.rand(5).zero? && source[:table].rowid? ? "#{source[:alias]}.rowid" : "#{source[:alias]}.#{quote(column)}"
	end

	def quote(name) = %("#{name}")
end
