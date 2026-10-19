# frozen_string_literal: true

test "create view v as select a from t" do
	node = parse_stmt("create view v as select a from t")

	assert_equal node.view.name, "v"
	assert_equal node.column_names, nil
	refute node.temporary
	assert_equal node.select.body.source.table, "t"
end

test "create temp view if not exists main.v (x, y) as select a, b from t" do
	node = parse_stmt("create temp view if not exists main.v (x, y) as select a, b from t")

	assert node.temporary
	assert node.if_not_exists
	assert_equal [node.view.schema, node.view.name], ["main", "v"]
	assert_equal node.column_names, ["x", "y"]
end

test "create view v as with c as (select 1 as n) select n from c union select 2" do
	node = parse_stmt("create view v as with c as (select 1 as n) select n from c union select 2")

	assert_operator Plume::CompoundSelect, :===, node.select.body
end
