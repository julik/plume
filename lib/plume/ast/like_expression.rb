# frozen_string_literal: true

module Plume
	# `left [NOT] LIKE right [ESCAPE escape]`. GLOB, REGEXP and MATCH have no ESCAPE
	# and are plain `BinaryExpression`s
	class LikeExpression < Node
		token :operator_tk
		token :escape_kw

		attr :left, Expression
		attr :right, Expression
		attr :escape, Expression

		def self.new(*, left:, right:, **) = super
		def self.concrete(*, operator_tk:, left:, right:, **) = super

		def left = @left
		def right = @right
		def escape = (@escape == LiteralNil) ? nil : @escape
		def operator = :LIKE
	end
end
