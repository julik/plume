# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_update.html)**
	#
	# ```sql
	# update or ignore t as x set a = u.a from u where u.id = x.id returning x.a
	# ```
	class UpdateStatement < Node
		include ConflictResolution

		token :update_kw # UPDATE [OR …]
		token :set_kw
		token :from_kw
		token :where_kw
		token :order_by_kw
		token :limit_kw
		token :offset_tk

		node :with_clause, WithClause
		node :table, TableName
		nodes :assignments, Assignment
		node :source, _Any
		node :condition, Expression
		node :returning, ReturningClause
		nodes :orderings, OrderingTerm
		node :limit, Expression
		node :offset, Expression

		def self.new(*, table:, assignments:, **) = super
		def self.concrete(*, update_kw:, table:, assignments:, **) = super

		inspectable def or_action = TOKEN_TO_RESOLUTION[update_kw_tok]
	end
end
