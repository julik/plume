# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_select.html)**
	#
	# ```sql
	# with t as (select 1) select * from t union select 2 order by 1 limit 1
	# ```
	#
	# `body` is a `SelectCore`, a `ValuesClause`, or a `CompoundSelect` of those.
	# `ORDER BY` and `LIMIT` belong to the statement as a whole, not to its last core.
	class SelectStatement < Node
		token :order_by_kw
		token :limit_kw
		token :offset_tk # OFFSET keyword, or the comma in `LIMIT offset, limit`

		node :with_clause, _Any
		node :body, _Any
		nodes :orderings, OrderingTerm
		attr :limit, Expression
		attr :offset, Expression

		def self.new(*, body:, **) = super
		def self.concrete(*, body:, **) = super

		def limit = (@limit == LiteralNil) ? nil : @limit
		def offset = (@offset == LiteralNil) ? nil : @offset

		# Every `SelectCore` and `ValuesClause` making up the body, left to right
		def cores
			case body
			when CompoundSelect then body.cores
			else [body]
			end
		end
	end
end
