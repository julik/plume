# frozen_string_literal: true

require "sqlite3"

# Asks SQLite which columns a statement reads, by preparing it with an authorizer
# callback installed. Used to check Plume.reads against the real thing.
class AuthorizerOracle
	SQLITE_READ = 20

	Result = Data.define(:tables, :columns)

	attr_reader :db, :catalog

	def initialize(schema_sql)
		@db = SQLite3::Database.new(":memory:")
		@db.execute_batch(schema_sql)
		@catalog = Plume::Catalog.from_sqlite(@db)
		@events = []
		@db.authorizer = proc do |action, table, column, *|
			@events << [table, column] if action == SQLITE_READ
			0
		end
	end

	def close = @db.close

	# Only base tables count - views and eponymous virtual tables like json_each
	# show up in the callback too, but Plume reports those separately
	def reads(sql)
		@events.clear
		@db.prepare(sql).close
		known = @catalog.tables.to_h { |t| [t.name.downcase, t.name] }

		tables = Set.new
		columns = Hash.new { |h, k| h[k] = Set.new }
		@events.each do |table, column|
			next unless (name = known[table.downcase])

			tables << name
			next if column.nil? || column.empty?

			columns[name] << (column.casecmp?("rowid") ? "rowid" : column)
		end
		Result.new(tables:, columns: columns.to_h)
	end
end
