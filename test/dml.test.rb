# frozen_string_literal: true

# -- INSERT

test "insert into t (a, b) values (1, 2), (3, ?)" do
	node = parse_stmt("insert into t (a, b) values (1, 2), (3, ?)")

	assert_operator Plume::InsertStatement, :===, node
	assert_equal node.table.name, "t"
	assert_equal node.column_names, ["a", "b"]
	assert_equal node.select.body.rows.size, 2
	assert_equal node.or_action, nil
	refute node.default_values
end

test "insert or ignore into main.t as x select * from u where true on conflict (a) where a > 0 do update set b = excluded.b where x.c is null on conflict do nothing returning *" do
	node = parse_stmt("insert or ignore into main.t as x select * from u where true on conflict (a) where a > 0 do update set b = excluded.b where x.c is null on conflict do nothing returning *")

	assert_equal node.or_action, :IGNORE
	assert_equal [node.table.schema, node.table.name, node.table.alias], ["main", "t", "x"]
	assert_equal node.select.body.source.table, "u"
	assert_equal node.upserts.map(&:action), [:UPDATE, :NOTHING]
	upsert = node.upserts[0]
	assert_equal upsert.targets.map { |t| t.expression.column }, ["a"]
	assert_operator Plume::BinaryExpression, :===, upsert.target_condition
	assert_equal upsert.assignments[0].column_names, ["b"]
	assert_equal upsert.assignments[0].value.table, "excluded"
	assert_equal upsert.condition.operator, :IS
	assert_operator Plume::StarResultColumn, :===, node.returning.columns[0]
end

test "replace into t default values" do
	node = parse_stmt("replace into t default values")

	assert_equal node.or_action, :REPLACE
	assert node.default_values
	assert_equal node.select, nil
end

test "insert into t values (1) returning a, b as c" do
	node = parse_stmt("insert into t values (1) returning a, b as c")

	assert_equal node.returning.columns.map(&:alias), [nil, "c"]
end

test "with s as (select 1 as a) insert into t select a from s" do
	node = parse_stmt("with s as (select 1 as a) insert into t select a from s")

	assert_equal node.with_clause.ctes[0].name, "s"
	assert_equal node.select.with_clause, nil
end

# -- UPDATE

test "update or replace t as x indexed by i set a = 1, (b, c) = (select 2, 3) from u where u.id = x.id returning x.a" do
	node = parse_stmt("update or replace t as x indexed by i set a = 1, (b, c) = (select 2, 3) from u where u.id = x.id returning x.a")

	assert_operator Plume::UpdateStatement, :===, node
	assert_equal node.or_action, :REPLACE
	assert_equal [node.table.name, node.table.alias, node.table.indexed_by], ["t", "x", "i"]
	assert_equal node.assignments.map(&:column_names), [["a"], ["b", "c"]]
	assert_operator Plume::SubqueryExpression, :===, node.assignments[1].value
	assert_equal node.source.table, "u"
	assert_operator Plume::BinaryExpression, :===, node.condition
	assert_equal node.returning.columns[0].result.table, "x"
end

test "update t set a = a + 1 order by b limit 10" do
	node = parse_stmt("update t set a = a + 1 order by b limit 10")

	assert_equal node.orderings.size, 1
	assert_equal node.limit.value, 10
end

test "with s as (select 1) update t set a = (select * from s)" do
	assert_equal parse_stmt("with s as (select 1) update t set a = (select * from s)").with_clause.ctes.size, 1
end

# -- DELETE

test "delete from t" do
	node = parse_stmt("delete from t")

	assert_operator Plume::DeleteStatement, :===, node
	assert_equal node.condition, nil
end

test "delete from main.t as x not indexed where x.a in (select a from u) returning *" do
	node = parse_stmt("delete from main.t as x not indexed where x.a in (select a from u) returning *")

	assert_equal [node.table.schema, node.table.alias], ["main", "x"]
	assert node.table.not_indexed
	assert_operator Plume::SubqueryExpression, :===, node.condition.right
	assert_equal node.returning.columns.size, 1
end

test "with old as (select id from t where a < 0) delete from t where id in old limit 5" do
	node = parse_stmt("with old as (select id from t where a < 0) delete from t where id in old limit 5")

	assert_equal node.condition.right.table, "old"
	assert_equal node.limit.value, 5
end
