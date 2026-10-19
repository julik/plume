# frozen_string_literal: true

module Plume
	class CommonTableExpression < Node
		token :name_tk
		token :columns_lp
		token :columns_rp
		token :as_kw
		token :materialized_tk
		token :select_lp
		token :select_rp

		attribute :name, Stringy
		nodes :columns, IndexedColumn
		node :select, SelectStatement

		def self.new(*, name:, select:, **) = super
		def self.concrete(*, name_tk:, select:, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
		def column_names = columns&.map(&:name)

		# true for MATERIALIZED, false for NOT MATERIALIZED, nil when left to the planner
		inspectable def materialized
			case materialized_tk_tok
			when :MATERIALIZED then true
			when [:NOT, :MATERIALIZED] then false
			end
		end
	end
end
