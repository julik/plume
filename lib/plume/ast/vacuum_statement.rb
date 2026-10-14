# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_vacuum.html)**
	class VacuumStatement < Node
		token :vacuum_kw
		token :schema_tk
		token :into_kw

		attr :schema, Stringy
		attr :into, Expression

		def self.new(*, **) = super
		def self.concrete(*, vacuum_kw:, **) = super

		def schema = (@schema == LiteralNil) ? schema_tk_val : @schema
		def into = (@into == LiteralNil) ? nil : @into
	end
end
