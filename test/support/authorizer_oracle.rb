# frozen_string_literal: true

require "sqlite3"

# Asks SQLite which columns a statement reads, by preparing it with an authorizer
# callback installed. Used to check Plume.reads against the real thing.
class AuthorizerOracle
	SQLITE_DELETE = 9
	SQLITE_INSERT = 18
	SQLITE_READ = 20
	SQLITE_UPDATE = 23

	Result = Data.define(:tables, :columns, :inserted, :updated, :deleted)

	attr_reader :db, :catalog

	def initialize(schema_sql)
		@db = SQLite3::Database.new(":memory:")
		@db.execute_batch(schema_sql)
		@catalog = Plume::Catalog.from_sqlite(@db)
		@events = []
		# The sqlite3 gem hands the names over as binary strings
		@db.authorizer = proc do |action, table, column, *|
			@events << [action, table&.force_encoding(Encoding::UTF_8), column&.force_encoding(Encoding::UTF_8)]
			0
		end
	end

	def close = @db.close

	# Every read SQLite reports must be one we report. We may report more, but only the join
	# columns of USING and NATURAL joins, which the authorizer does not mention. Writes must match
	# exactly, down to the updated columns - SQLite does not name the columns of an INSERT
	def self.mismatches(expected, access)
		reads = access.reads
		writes = access.writes
		ours = reads.columns
		problems = []

		missing = expected.columns.flat_map { |t, cs| (cs - (ours[t] || Set.new)).map { |c| "#{t}.#{c}" } }
		problems << "SQLite reads #{missing.join(", ")} but we do not" if missing.any?
		problems << "SQLite reads tables #{(expected.tables - reads.tables).to_a}" unless expected.tables <= reads.tables

		# A column called "" cannot be told apart from reading the table as a whole, which the
		# authorizer also reports with an empty column name
		extra = reads.references.reject do |ref|
			ref.column.nil? || ref.column.empty? || expected.columns[ref.table_key]&.include?(ref.column) || Plume::Join === ref.node
		end
		problems << "we report #{extra.map { |r| "#{r.table_key}.#{r.column}" }.uniq.join(", ")} but SQLite does not" if extra.any?

		{ inserted: [writes.tables(:insert), expected.inserted], updated: [writes.updated, expected.updated],
			deleted: [writes.deleted, expected.deleted] }.each do |what, (our_value, sqlite_value)|
			problems << "we report #{what} #{our_value.inspect}, SQLite #{sqlite_value.inspect}" unless our_value == sqlite_value
		end
		problems
	end

	# Only base tables count - views and eponymous virtual tables like json_each
	# show up in the callback too, but Plume reports those separately
	def reads(sql)
		@events.clear
		@db.prepare(sql).close
		known = @catalog.tables.to_h { |t| [t.name.downcase(:ascii), t.name] }

		tables = Set.new
		columns = Hash.new { |h, k| h[k] = Set.new }
		inserted = Set.new
		updated = Hash.new { |h, k| h[k] = Set.new }
		deleted = Set.new
		# For INSERT and DELETE the table comes as the first argument, the second is the schema
		@events.each do |action, table, column|
			next unless table && (name = known[table.downcase(:ascii)])

			case action
			when SQLITE_INSERT then inserted << name
			when SQLITE_DELETE then deleted << name
			when SQLITE_UPDATE then updated[name] << column
			when SQLITE_READ
				tables << name
				# Any spelling of the rowid is "rowid" to us, unless the table has a real column by that name
				columns[name] << (@catalog.table(name).column(column) || "rowid") unless column.nil? || column.empty?
			end
		end
		# Plain hashes, a default proc would grow the result whenever someone looked up a table
		Result.new(tables:, columns: columns.to_h { |k, v| [k, v] }, inserted:, updated: updated.to_h { |k, v| [k, v] }, deleted:)
	end
end
