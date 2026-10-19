# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/pragma.html)**
	class PragmaStatement < Node
		token :pragma_kw
		token :schema_tk
		token :dot_tk
		token :name_tk
		token :eq_tk # `=`, or the opening parenthesis of `PRAGMA name(value)`
		token :value_tk
		token :value_rp

		attr :schema, Stringy
		attr :name, Stringy

		def self.new(*, name:, **) = super
		def self.concrete(*, pragma_kw:, name_tk:, **) = super

		def schema = (@schema == LiteralNil) ? schema_tk_val : @schema
		def name = (@name == LiteralNil) ? name_tk_val : @name

		# As written: numbers come out as numbers, keywords and names as strings
		inspectable def value = value_tk_val
	end
end
