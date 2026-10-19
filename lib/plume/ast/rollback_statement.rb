# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_transaction.html)**
	class RollbackStatement < Node
		token :rollback_kw
		token :transaction_kw
		token :name_tk
		token :to_kw # TO or TO SAVEPOINT
		token :savepoint_tk

		attr :savepoint, Stringy

		def self.new(*, **) = super
		def self.concrete(*, rollback_kw:, **) = super

		def savepoint = (@savepoint == LiteralNil) ? savepoint_tk_val : @savepoint
	end
end
