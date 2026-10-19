# frozen_string_literal: true

module Plume
	# A named window from the `WINDOW` clause of a select core
	class WindowDefinition < Node
		token :name_tk
		token :as_kw
		token :window_lp
		token :base_window_name_tk
		token :partition_by_kw
		token :order_by_kw
		token :window_rp

		attribute :name, Stringy
		attribute :base_window_name, Stringy
		nodes :partitions, Expression
		nodes :orderings, OrderingTerm
		node :frame, FrameSpec

		def self.new(*, name:, **) = super
		def self.concrete(*, name_tk:, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
		def base_window_name = (@base_window_name == LiteralNil) ? base_window_name_tk_val : @base_window_name
	end
end
