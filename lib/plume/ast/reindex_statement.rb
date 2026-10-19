# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_reindex.html)**
	#
	# `target` names a schema, table or index - SQLite works out which at run time
	class ReindexStatement < Node
		token :reindex_kw

		node :target, TableName

		def self.new(*, **) = super
		def self.concrete(*, reindex_kw:, **) = super
	end
end
