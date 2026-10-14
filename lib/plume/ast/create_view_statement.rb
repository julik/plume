# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_createview.html)**
	#
	# ```sql
	# create temp view if not exists v (a, b) as select 1, 2
	# ```
	class CreateViewStatement < Node
		token :create_kw
		token :temp_kw
		token :view_kw
		token :if_not_exists_kw
		token :columns_lp
		token :columns_rp
		token :as_kw

		node :view, TableName
		nodes :columns, IndexedColumn
		node :select, SelectStatement

		def self.new(*, view:, select:, **) = super
		def self.concrete(*, create_kw:, view_kw:, view:, select:, **) = super

		inspectable def temporary = !!@temp_kw
		inspectable def if_not_exists = !!@if_not_exists_kw

		def column_names = columns&.map(&:name)
	end
end
