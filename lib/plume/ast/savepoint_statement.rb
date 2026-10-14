# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_savepoint.html)**
	class SavepointStatement < Node
		token :savepoint_kw
		token :name_tk

		attr :name, Stringy

		def self.new(*, name:, **) = super
		def self.concrete(*, savepoint_kw:, name_tk:, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
	end
end
