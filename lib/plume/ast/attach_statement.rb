# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_attach.html)**
	class AttachStatement < Node
		token :attach_kw # ATTACH or ATTACH DATABASE
		token :as_kw
		token :key_kw

		node :file, Expression
		node :schema, Expression
		node :key, Expression

		def self.new(*, file:, schema:, **) = super
		def self.concrete(*, attach_kw:, file:, schema:, **) = super
	end
end
