# frozen_string_literal: true

# Hashing a node hashes its whole subtree, so a type check that hashed one would make building a tree quadratic
class Quickdraw::Test
	def unhashable_column
		column = Plume::ColumnName.new(column: "a")
		def column.hash = raise("hashed a node")
		column
	end
end

test "a node is type-checked without being hashed" do
	assert_equal Plume::BinaryExpression.new(operator: :ADD, left: unhashable_column, right: Plume::LiteralExpression.new(value: 1)).to_sql, "a + 1"
end

test "a list of nodes is type-checked without being hashed" do
	assert_equal Plume::FunctionReference.new(
		function: "f",
		arguments: Plume::FunctionArguments.new(expressions: [unhashable_column]),
	).to_sql, "f(a)"
end

test "a union still matches its plain values and rejects others" do
	assert Plume::Union.new(:A, String) === :A
	assert Plume::Union.new(:A, String) === "b"
	refute Plume::Union.new(:A, String) === :B
end
