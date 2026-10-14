# frozen_string_literal: true

test "keywords come out upper case, compound operands parenthesized" do
	assert_equal parse_stmt("select a+b*c, not x or y from t where a between 1 and 2 limit 5, 10").to_sql,
		"SELECT a + (b * c), (NOT x) OR y FROM t WHERE a BETWEEN 1 AND 2 LIMIT 10 OFFSET 5"
end

test "identifiers are quoted only when they have to be" do
	assert_equal parse_stmt(%(select "plain", "two words", "select", [br], "q""uote" from `t`)).to_sql,
		%(SELECT plain, "two words", "select", br, "q""uote" FROM t)
end

test "literals keep their meaning" do
	assert_equal parse_stmt("select 'it''s', x'00ff', 0x1F, 1e3, null, true, current_date, -1, - -1").to_sql,
		"SELECT 'it''s', X'00FF', 0x1F, 1e3, NULL, TRUE, CURRENT_DATE, -1, -(-1)"
end

test "aliases always get their AS" do
	assert_equal parse_stmt("select a x from t y").to_sql, "SELECT a AS x FROM t AS y"
end

test "a tree built by hand prints" do
	node = Plume::BinaryExpression.new(
		operator: :EQUALS,
		left: Plume::ColumnName.new(table: "users", column: "e-mail"),
		right: Plume::LiteralExpression.new(value: "o'hara"),
	)

	assert_equal node.to_sql, %(users."e-mail" = 'o''hara')
end

test "a parsed tree changed after the fact prints the change" do
	node = parse_stmt("select a from t where b = 1")
	node.body.condition = Plume::BinaryExpression.new(
		operator: :ALL,
		left: node.body.condition,
		right: Plume::BinaryExpression.new(operator: :EQUALS, left: Plume::ColumnName.new(column: "tenant_id"), right: Plume::Variable.new(name: "?")),
	)

	assert_equal node.to_sql, "SELECT a FROM t WHERE (b = 1) AND (tenant_id = ?)"
end

test "identifiers that are not valid UTF-8 get quoted rather than raising" do
	sql = "select \xFFa from t"

	assert_equal parse_stmt(sql).to_sql, "SELECT \"\xFFa\" FROM t"
end

test "numeric literals have the value SQLite gives them" do
	values = parse_stmt("select 0x1F, 0x1_F, 1_000, 1e5_0, 0xFFFFFFFFFFFFFFFF, 1_0.5").body.columns.map { |c| c.result.value }

	assert_equal values, [31, 31, 1000, 1e50, -1, 10.5]
	assert_equal parse_stmt("create table t (a default - /* minus */ 0x10)").columns[0].constraints[0].value, -16
	assert_equal parse_stmt("pragma cache_size = - 2000").to_sql, "PRAGMA cache_size = -2000"
end

test "collation names only have their ASCII letters upcased" do
	assert_equal parse_stmt("select a from t order by a collate nöcase").to_sql, %(SELECT a FROM t ORDER BY a COLLATE "NöCASE")
	assert_equal parse_stmt("create index i on t (a collate no\xFFcase)").to_sql, %(CREATE INDEX i ON t (a COLLATE "NO\xFFCASE"))
end

test "names that are keywords get quoted even where SQLite could take them bare" do
	assert_equal parse_stmt(%(select "raise", "key" from "if")).to_sql, %(SELECT "raise", "key" FROM "if")
end

test "printing a long chain of joins takes time in proportion to its length" do
	statement = ->(n) { parse_stmt("select 1 from t0 #{(1..n).map { |i| "join t#{i} on t#{i}.a = t#{i - 1}.a" }.join(" ")}") }
	small, large = statement.(1000), statement.(16_000)
	time = ->(node) { Array.new(3) { Process.clock_gettime(Process::CLOCK_MONOTONIC).then { |t| node.to_sql; Process.clock_gettime(Process::CLOCK_MONOTONIC) - t } }.min }

	# 16 times the joins, so about 16 times the time - it was more like 60 when every join copied the clause so far
	assert time.(large) / time.(small) < 32
end
