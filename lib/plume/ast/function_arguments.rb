# frozen_string_literal: true

module Plume
	class FunctionArguments < Node
		token :distinct_kw
		token :order_by_kw

		attribute :distinct, _Boolean
		nodes :expressions, Expression
		nodes :order_by, OrderingTerm

		def self.new(*, expressions:, **) = super
		def self.concrete(*, expressions:, **) = super

		# ALL is the default, written out - only DISTINCT makes the aggregate distinct
		def distinct = (@distinct == LiteralNil) ? (distinct_kw_tok == :DISTINCT) : @distinct
	end
end
