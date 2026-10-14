# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_delete.html)**
	#
	# ```sql
	# delete from t where a > 1 returning *
	# ```
	class DeleteStatement < Node
		token :delete_kw
		token :from_kw
		token :where_kw
		token :order_by_kw
		token :limit_kw
		token :offset_tk

		node :with_clause, WithClause
		node :table, TableName
		attr :condition, Expression
		node :returning, ReturningClause
		nodes :orderings, OrderingTerm
		attr :limit, Expression
		attr :offset, Expression

		def self.new(*, table:, **) = super
		def self.concrete(*, delete_kw:, from_kw:, table:, **) = super

		def condition = (@condition == LiteralNil) ? nil : @condition
		def limit = (@limit == LiteralNil) ? nil : @limit
		def offset = (@offset == LiteralNil) ? nil : @offset
	end
end
