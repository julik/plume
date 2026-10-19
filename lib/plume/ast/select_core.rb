# frozen_string_literal: true

module Plume
	# A single `SELECT … FROM … WHERE … GROUP BY … HAVING … WINDOW …`, without the
	# statement-level `WITH`, `ORDER BY` and `LIMIT`
	class SelectCore < Node
		token :select_kw
		token :type_tk
		token :from_kw
		token :where_kw
		token :group_by_kw
		token :having_kw
		token :window_kw

		nodes :columns, _Union(ResultColumn, StarResultColumn)
		node :source, _Any
		node :condition, Expression
		nodes :groupings, Expression
		node :having, Expression
		nodes :windows, WindowDefinition

		def self.new(*, columns:, **) = super
		def self.concrete(*, select_kw:, columns:, **) = super

		inspectable def distinct = type_tk_tok == :DISTINCT
	end
end
