# frozen_string_literal: true

module Plume
	class FunctionArguments < Node
		token :distinct_kw
		token :order_by_kw

		attr :distinct, _Boolean
		nodes :expressions, Expression
		nodes :order_by, OrderingTerm

		def self.new(*, expressions:, **) = super
		def self.concrete(*, expressions:, **) = super

		def distinct = (@distinct == LiteralNil) ? distinct_kw? : @distinct
	end
end
