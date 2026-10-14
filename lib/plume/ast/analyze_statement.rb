# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_analyze.html)**
	#
	# `target` names a schema, table or index - SQLite works out which at run time
	class AnalyzeStatement < Node
		token :analyze_kw

		node :target, TableName

		def self.new(*, **) = super
		def self.concrete(*, analyze_kw:, **) = super
	end
end
