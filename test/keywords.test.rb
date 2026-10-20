# frozen_string_literal: true

# SQLite's tokenizer always calls WINDOW, OVER and FILTER keywords; whether they are, it decides
# from the tokens around them (tokenize.c), so Plume.tokenize keeps them and the parser decides
test "window, over and filter are names except where SQLite reads them as keywords" do
	statement = parse_stmt("SELECT sum(filter.over) FILTER (WHERE x) OVER window FROM t AS filter WINDOW window AS (ORDER BY x)")
	call = statement.body.columns.first.result

	assert_equal call.arguments.expressions.first.table, "filter"
	assert_equal call.arguments.expressions.first.column, "over"
	refute_equal call.filter_clause, nil
	assert_equal statement.body.windows.first.name, "window"
	assert_equal Plume.tokenize("SELECT window, over, filter"), [:SELECT, :WINDOW, :COMMA, :OVER, :COMMA, :FILTER]
end

test "over after a call with no window is an alias" do
	assert_equal parse_stmt("SELECT b() OVER, c FROM t").body.columns.first.alias, "OVER"
end

test "true, false and the current_* keywords name tables and columns, and are literals otherwise" do
	assert_equal parse_stmt("CREATE TABLE current_date(true INT, false INT)").columns.map(&:name), ["true", "false"]
	assert_equal parse_stmt("SELECT false.false FROM t").body.columns.first.result.table, "false"
	assert_equal parse_stmt("SELECT true, current_time").body.columns.map { |c| c.result.value }, [true, :CURRENT_TIME]
end

test "a name that would read back as the start of an expression prints quoted" do
	assert_equal parse_stmt(%(SELECT * FROM cast ORDER BY "raise")).to_sql, %(SELECT * FROM "cast" ORDER BY "raise")
	assert_equal parse_stmt("SELECT key FROM true").to_sql, %(SELECT key FROM "true")
end
