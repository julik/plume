# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_createindex.html)**
	class CreateIndexStatement < Node
		token :create_kw
		token :unique_kw
		token :index_kw
		token :if_not_exists_kw
		token :on_kw
		token :table_tk
		token :columns_lp
		token :columns_rp
		token :where_kw

		node :index, TableName
		attr :table, Stringy
		nodes :columns, OrderingTerm
		node :condition, Expression

		def self.new(*, index:, table:, columns:, **) = super
		def self.concrete(*, create_kw:, index_kw:, index:, table_tk:, columns:, **) = super

		def table = (@table == LiteralNil) ? table_tk_val : @table

		inspectable def unique = unique_kw?
		inspectable def if_not_exists = if_not_exists_kw?
	end
end
