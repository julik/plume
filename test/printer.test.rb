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
