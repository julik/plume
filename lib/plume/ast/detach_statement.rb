# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_detach.html)**
	class DetachStatement < Node
		token :detach_kw # DETACH or DETACH DATABASE

		attr :schema, Expression

		def self.new(*, schema:, **) = super
		def self.concrete(*, detach_kw:, schema:, **) = super

		def schema = @schema
	end
end
