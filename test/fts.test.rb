# frozen_string_literal: true

# FTS5 nests other languages inside SQL: the module arguments of CREATE VIRTUAL TABLE have
# their own syntax (with quotes inside quotes), MATCH takes a whole query language inside a
# string literal, the table's own name doubles as a hidden column, and some INSERTs are
# really commands. None of that is ours to parse - but all of it has to come through a round
# trip intact, and the reads have to be right.

require "sqlite3"
require_relative "support/authorizer_oracle"

FTS_SCHEMA = <<~SQL
	CREATE TABLE docs (id INTEGER PRIMARY KEY, title TEXT, body TEXT, secret TEXT);
	CREATE VIRTUAL TABLE docs_fts USING fts5(
		title, body,
		content = 'docs', content_rowid = 'id',
		tokenize = 'unicode61 tokenchars ''-_''',
		prefix = '2 3'
	);
SQL

FTS_ROWS = [
	[1, "Active Record basics", "ruby on rails models and active record queries", "a"],
	[2, "Rails routing", "routes in ruby on rails, not php", "b"],
	[3, "PHP and SQL", "php talks to sql through pdo", "c"],
	[4, "snake_case-names", "tokenchars keep snake_case-names whole", "d"],
]

FTS_QUERIES = [
	%q{SELECT rowid, title FROM docs_fts WHERE docs_fts MATCH '"active record" OR (rails NOT php)' ORDER BY rank},
	%q{SELECT rowid FROM docs_fts WHERE docs_fts MATCH 'NEAR(ruby rails, 3)' ORDER BY rowid},
	%q{SELECT rowid FROM docs_fts WHERE docs_fts MATCH '{title}: rail*' ORDER BY rowid},
	%q{SELECT rowid FROM docs_fts WHERE docs_fts MATCH '^php' ORDER BY rowid},
	# A hyphen ends an FTS5 bareword, so the term goes in an FTS5 phrase inside the SQL string
	%q{SELECT rowid FROM docs_fts WHERE docs_fts MATCH '"snake_case-names"' ORDER BY rowid},
	%q{SELECT highlight(docs_fts, 0, '<b>', '</b>'), snippet(docs_fts, 1, '[', ']', '...', 4) FROM docs_fts WHERE docs_fts MATCH 'ruby' ORDER BY rowid},
	%q{SELECT rowid, round(bm25(docs_fts, 10.0, 1.0), 3) FROM docs_fts('rails') ORDER BY rowid},
	%q{SELECT d.title FROM docs AS d JOIN docs_fts AS f ON f.rowid = d.id WHERE f.docs_fts MATCH 'title : sql' ORDER BY d.id},
	%q{SELECT rowid FROM docs_fts WHERE docs_fts = '"it''s" OR ruby' ORDER BY rowid},
]

class Quickdraw::Test
	def fts_db
		db = SQLite3::Database.new(":memory:")
		db.execute_batch(FTS_SCHEMA)
		FTS_ROWS.each { |row| db.execute("INSERT INTO docs VALUES (?, ?, ?, ?)", row) }
		db.execute("INSERT INTO docs_fts(docs_fts) VALUES ('rebuild')")
		db
	end
end

test "CREATE VIRTUAL TABLE keeps the module's own argument syntax intact" do
	node = Plume.parse(FTS_SCHEMA).last

	assert_equal node.module_name, "fts5"
	assert_equal node.arguments, [
		"title", "body", "content = 'docs'", "content_rowid = 'id'",
		"tokenize = 'unicode61 tokenchars ''-_'''", "prefix = '2 3'",
	]
end

test "the printed FTS5 schema builds the same table" do
	printed = round_trip(FTS_SCHEMA)
	db = SQLite3::Database.new(":memory:")
	db.execute_batch(printed)

	assert_equal db.execute("PRAGMA table_xinfo(docs_fts)").map { |r| r[1] }, ["title", "body", "docs_fts", "rank"]
	# With `tokenchars '-_'` intact the whole thing is one token, so "names" alone finds nothing -
	# proof the quotes inside the quotes inside the module arguments survived
	db.execute("INSERT INTO docs_fts(rowid, title, body) VALUES (1, 'x', 'snake_case-names')")
	assert_equal db.execute(%q{SELECT rowid FROM docs_fts WHERE docs_fts MATCH '"snake_case-names"'}), [[1]]
	assert_equal db.execute(%q{SELECT rowid FROM docs_fts WHERE docs_fts MATCH 'names'}), []
ensure
	db&.close
end

FTS_QUERIES.each do |sql|
	test "round trip: #{sql}" do
		db = fts_db
		printed = round_trip(sql)

		# The MATCH strings are queries in their own right, they must come out byte for byte
		assert_equal db.execute(printed), db.execute(sql)
		refute db.execute(sql).empty?
	ensure
		db&.close
	end
end

test "FTS5 commands are INSERTs with SQL in a string" do
	sql = "INSERT INTO docs_fts(docs_fts, rank) VALUES ('rank', 'bm25(10.0, 5.0)')"
	node = parse_stmt(sql)

	assert_equal node.column_names, ["docs_fts", "rank"]
	assert_equal node.select.body.rows[0].values.map(&:value), ["rank", "bm25(10.0, 5.0)"]
	round_trip(sql)
end

test "reads of FTS queries match SQLite's" do
	oracle = AuthorizerOracle.new(FTS_SCHEMA)

	[*FTS_QUERIES, "SELECT * FROM docs_fts('ruby') ORDER BY rank"].each do |sql|
		expected = oracle.reads(sql)
		reads = Plume.reads(sql, catalog: oracle.catalog)

		assert_equal reads.tables, expected.tables
		assert_equal reads.columns, expected.columns
	end
ensure
	oracle&.close
end

test "a virtual table called like a function is read like a table" do
	catalog = Plume::Catalog.from_sql(FTS_SCHEMA)
	catalog.add_table("docs_fts", %w[title body], hidden_columns: %w[docs_fts rank])
	reads = Plume.reads("SELECT * FROM docs_fts('ruby')", catalog:)

	# Otherwise `SELECT * FROM users_fts('x')` would slip past a column check unseen
	assert_equal reads.columns, { "docs_fts" => Set["title", "body"] }
	assert_equal reads.functions.to_a, []
end
