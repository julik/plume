# frozen_string_literal: true

require "sqlite3"
require_relative "../support/fuzz"
require_relative "../support/ast_shape"
require_relative "../support/authorizer_oracle"
require_relative "../support/query_generator"

# A schema made of names nobody should use - keywords, quotes of every kind, spaces, emoji,
# combining marks, things that look like comments or bind parameters - and statements over it.
# Whatever SQLite takes we parse, the names come back exactly, the printed SQL is SQL that
# SQLite takes and that reads and writes the same things, and Plume.access agrees with
# SQLite's authorizer
random = Fuzz.random("identifiers")
quote = ->(name) { Fuzz.quote_name(name, random) }
unique = ->(names) { names.uniq { |n| n.downcase(:ascii) } }

setup = SQLite3::Database.new(":memory:")
creates = []
40.times do
	break if creates.size >= 12

	name = Fuzz.crazy_name(random)
	columns = unique.(Array.new(random.rand(1..4)) { Fuzz.crazy_name(random) })
	primary_key = random.rand(3).zero? ? 0 : nil
	definitions = columns.each_with_index.map do |column, i|
		[quote.(column), i == primary_key ? "INTEGER PRIMARY KEY" : %w[TEXT INT BLOB].sample(random:)].compact.join(" ")
	end
	sql = "CREATE TABLE #{quote.(name)} (#{definitions.join(", ")})"
	setup.execute(sql)
	creates << [sql, name, columns]
rescue SQLite3::Exception
	nil # a name SQLite will not have, like sqlite_anything or a repeat
end

indexes = creates.first(6).filter_map do |_, table, columns|
	sql = "CREATE INDEX #{quote.(Fuzz.crazy_name(random))} ON #{quote.(table)} (#{quote.(columns.first)})"
	setup.execute(sql)
	[sql, table, columns.first]
rescue SQLite3::Exception
	nil
end

catalog = Plume::Catalog.from_sqlite(setup)
generator = QueryGenerator.new(catalog, seed: Fuzz.seed, names: -> { Fuzz.crazy_name(random) }, quote:)
queries = Array.new(Fuzz.iterations(1200)) do |i|
	sql = i.even? ? generator.query : generator.statement
	setup.prepare(sql).close
	sql
rescue SQLite3::Exception
	nil # quoting a keyword-ish name bare is sometimes too much for SQLite
end.compact
schema = (creates + indexes).map(&:first).join(";\n")
setup.close

# The connections are opened lazily, by each quickdraw worker for itself
module IdentifierFuzz
	extend self

	attr_accessor :schema

	def oracle = @oracle ||= AuthorizerOracle.new(schema)

	# A few rows in each table, so that statements can also be compared by what they return
	def data
		@data ||= SQLite3::Database.new(":memory:").tap do |db|
			db.execute_batch(schema)
			db.execute("SELECT name FROM sqlite_master WHERE type = 'table'").each do |(table)|
				count = db.execute(%(SELECT count(*) FROM pragma_table_info(?)), [table]).first.first
				3.times { |i| db.execute(%(INSERT INTO "#{table.gsub('"', '""')}" VALUES (#{Array.new(count) { i }.join(", ")}))) }
			end
		end
	end

	def table_info(db, table) = db.execute(%(SELECT name, type, pk FROM pragma_table_xinfo(?)), [table])

	def rows(sql) = data.execute(sql).map(&:inspect).sort
end
IdentifierFuzz.schema = schema

def round_trip(sql)
	statements = Plume.parse(sql)
	printed = statements.map(&:to_sql).join(";\n")
	assert_equal AstShape.of(Plume.parse(printed)), AstShape.of(statements)
	[statements.first, printed]
end

creates.each_with_index do |(sql, name, columns), i|
	test "identifiers: table #{i} #{Fuzz.describe(sql)}" do
		statement, printed = round_trip(sql)

		assert_equal statement.table.name, name
		assert_equal statement.columns.map(&:name), columns

		db = SQLite3::Database.new(":memory:")
		db.execute(printed)
		assert_equal db.execute("SELECT name FROM sqlite_master").flatten, [name]
		assert_equal IdentifierFuzz.table_info(db, name), IdentifierFuzz.table_info(IdentifierFuzz.oracle.db, name)
	ensure
		db&.close
	end
end

indexes.each_with_index do |(sql, table, column), i|
	test "identifiers: index #{i} #{Fuzz.describe(sql)}" do
		statement, printed = round_trip(sql)

		assert_equal statement.table, table
		assert_equal statement.columns.map { |c| c.expression.column }, [column]

		db = SQLite3::Database.new(":memory:")
		db.execute_batch(IdentifierFuzz.schema)
		before = db.execute("SELECT name, tbl_name FROM sqlite_master WHERE type = 'index'")
		db.execute("DROP INDEX #{Plume::Printer.new.identifier(statement.index.name)}")
		db.execute(printed)
		assert_equal db.execute("SELECT name, tbl_name FROM sqlite_master WHERE type = 'index'").sort, before.sort
	ensure
		db&.close
	end
end

queries.each_with_index do |sql, i|
	test "identifiers: statement #{i} #{Fuzz.describe(sql)}" do
		statement, printed = round_trip(sql)
		oracle = IdentifierFuzz.oracle
		expected = oracle.reads(sql)

		problems = AuthorizerOracle.mismatches(expected, Plume.access(statement, catalog: oracle.catalog))
		assert(problems.empty?) { "#{problems.join("\n")}\n#{Fuzz.replay}" }
		assert_equal oracle.reads(printed), expected
		assert_equal IdentifierFuzz.rows(printed), IdentifierFuzz.rows(sql) if Plume::SelectStatement === statement
	end
end
