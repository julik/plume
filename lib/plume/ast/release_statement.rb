# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_savepoint.html)**
	class ReleaseStatement < Node
		token :release_kw # RELEASE or RELEASE SAVEPOINT
		token :name_tk

		attribute :name, Stringy

		def self.new(*, name:, **) = super
		def self.concrete(*, release_kw:, name_tk:, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
	end
end
