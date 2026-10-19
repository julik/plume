# frozen_string_literal: true

module Plume
	# A bind parameter: `?`, `?1`, `:name`, `@name` or `$name`
	class Variable < Node
		token :name_tk

		attr :name, Stringy

		def self.new(*, name:, **) = super
		def self.concrete(*, name_tk:, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
	end
end
