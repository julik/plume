# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_insert.html)**
	#
	# ```sql
	# insert or ignore into t (a, b) select x, y from u on conflict (a) do nothing returning *
	# ```
	#
	# Rows come from `select` (a SelectStatement, VALUES included) or are DEFAULT VALUES.
	class InsertStatement < Node
		include ConflictResolution

		token :insert_kw # INSERT [OR …], or REPLACE
		token :into_kw
		token :columns_lp
		token :columns_rp
		token :default_values_kw

		node :with_clause, WithClause
		node :table, TableName
		nodes :columns, ColumnName
		node :select, SelectStatement
		nodes :upserts, UpsertClause
		node :returning, ReturningClause

		def self.new(*, table:, **) = super
		def self.concrete(*, insert_kw:, into_kw:, table:, **) = super

		inspectable def or_action = TOKEN_TO_RESOLUTION[insert_kw_tok]
		inspectable def default_values = default_values_kw?

		def column_names = columns&.map(&:column)
	end
end
