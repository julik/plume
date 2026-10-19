# frozen_string_literal: true

module Plume
	# `left [NOT] LIKE right [ESCAPE escape]`. GLOB, REGEXP and MATCH have no ESCAPE
	# and are plain `BinaryExpression`s
	class LikeExpression < Node
		token :operator_tk
		token :escape_kw

		node :left, Expression
		node :right, Expression
		node :escape, Expression

		def self.new(*, left:, right:, **) = super
		def self.concrete(*, operator_tk:, left:, right:, **) = super

		def operator = :LIKE
	end
end
