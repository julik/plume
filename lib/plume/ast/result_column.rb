# frozen_string_literal: true

module Plume
	class ResultColumn < Node
		token :as_kw
		token :alias_tk
		token :result_tk

		node :result, Expression
		attribute :alias, Stringy

		def self.new(*, result:, **) = super
		def self.concrete(*, **) = super

		def result = (@result == LiteralNil) ? result_tk_val : @result
		def alias = (@alias == LiteralNil) ? alias_tk_val : @alias
	end
end
