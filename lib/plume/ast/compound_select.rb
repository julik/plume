# frozen_string_literal: true

module Plume
	# Compound operators all have the same precedence and associate to the left, so
	# `a UNION b EXCEPT c` is `(a UNION b) EXCEPT c` and `right` is never a compound
	class CompoundSelect < Node
		TOKEN_TO_OPERATOR = {
			:UNION                    => :UNION,
			[:UNION, :ALL].freeze     => :UNION_ALL,
			:INTERSECT                => :INTERSECT,
			:EXCEPT                   => :EXCEPT,
		}.freeze
		Operator = _Union(*TOKEN_TO_OPERATOR.values)

		token :operator_tk

		attr :operator, Operator
		node :left, _Any
		node :right, _Any

		def self.new(*, operator:, left:, right:, **) = super
		def self.concrete(*, operator_tk:, left:, right:, **) = super

		def operator = (@operator == LiteralNil) ? TOKEN_TO_OPERATOR[operator_tk_tok] : @operator

		def cores
			[*(CompoundSelect === left ? left.cores : [left]), right]
		end
	end
end
