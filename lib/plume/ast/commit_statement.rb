# frozen_string_literal: true

module Plume
	# COMMIT or END. **[SQLite Docs](https://www.sqlite.org/lang_transaction.html)**
	class CommitStatement < Node
		token :commit_kw
		token :transaction_kw
		token :name_tk

		def self.new(*, **) = super
		def self.concrete(*, commit_kw:, **) = super
	end
end
