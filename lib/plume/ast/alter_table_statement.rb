# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_altertable.html)**
	#
	# `action` is :RENAME_TABLE, :RENAME_COLUMN, :ADD_COLUMN, :DROP_COLUMN, :ADD_CONSTRAINT (a CHECK),
	# :DROP_CONSTRAINT, :SET_NOT_NULL or :DROP_NOT_NULL
	class AlterTableStatement < Node
		Action = _Union(
			:RENAME_TABLE, :RENAME_COLUMN, :ADD_COLUMN, :DROP_COLUMN,
			:ADD_CONSTRAINT, :DROP_CONSTRAINT, :SET_NOT_NULL, :DROP_NOT_NULL,
		)

		token :alter_table_kw
		token :action_kw # RENAME [COLUMN], ADD [COLUMN], DROP [COLUMN], DROP CONSTRAINT or ALTER [COLUMN]
		token :column_tk
		token :to_kw
		token :new_name_tk
		token :constraint_name_tk
		token :not_null_kw # SET NOT NULL or DROP NOT NULL

		node :table, TableName
		attribute :action, Action
		node :column_definition, ColumnDefinition
		node :constraint, CheckTableConstraint
		node :conflict_clause, ConflictClause
		attribute :column, Stringy
		attribute :new_name, Stringy
		attribute :constraint_name, Stringy

		def self.new(*, table:, action:, **) = super
		def self.concrete(*, alter_table_kw:, table:, action:, **) = super

		def action = @action
		def column = (@column == LiteralNil) ? column_tk_val : @column
		def new_name = (@new_name == LiteralNil) ? new_name_tk_val : @new_name
		# The constraint dropped, or added - which keeps its name on `constraint`
		def constraint_name = (@constraint_name == LiteralNil) ? (constraint_name_tk_val || constraint&.name) : @constraint_name
	end
end
