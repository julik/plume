# frozen_string_literal: true

module Plume
	# `left [NOT] BETWEEN middle AND right`
	class TernaryExpression < Node
		TOKEN_TO_OPERATOR = {
			:BETWEEN                      => :BETWEEN,
			[:BETWEEN].freeze             => :BETWEEN,
			[:NOT, :BETWEEN].freeze       => :NOT_BETWEEN,
		}.freeze
		Operator = _Union(*TOKEN_TO_OPERATOR.values)

		token :operator_tk
		token :and_kw

		attribute :operator, Operator
		node :left, Expression
		node :middle, Expression
		node :right, Expression

		def self.new(*, operator:, left:, middle:, right:, **) = super
		def self.concrete(*, operator_tk:, left:, middle:, right:, **) = super

		def operator = (@operator == LiteralNil) ? TOKEN_TO_OPERATOR[operator_tk_tok] : @operator
	end
end
