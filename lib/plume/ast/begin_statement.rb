# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_transaction.html)**
	class BeginStatement < Node
		token :begin_kw
		token :type_kw
		token :transaction_kw
		token :name_tk

		def self.new(*, **) = super
		def self.concrete(*, begin_kw:, **) = super

		# :DEFERRED, :IMMEDIATE, :EXCLUSIVE, or nil for SQLite's default (deferred)
		inspectable def type = type_kw_tok
	end
end
