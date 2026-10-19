# frozen_string_literal: true

module Plume
	class JoinOperator < Node
		Kind = _Union(:COMMA, :INNER, :LEFT, :RIGHT, :FULL, :CROSS)

		token :operator_tk

		attr :kind, Kind
		attr :natural, _Boolean

		def self.new(*, kind:, **) = super
		def self.concrete(*, operator_tk:, **) = super

		def kind
			return @kind unless @kind == LiteralNil

			keywords = operator_keywords
			return :COMMA if keywords == [:COMMA]

			(keywords & [:LEFT, :RIGHT, :FULL, :CROSS]).first || :INNER
		end

		def natural = (@natural == LiteralNil) ? operator_keywords.include?(:NATURAL) : @natural
		def outer? = [:LEFT, :RIGHT, :FULL].include?(kind)

		private

		def operator_keywords = Array(operator_tk_tok)
	end
end
