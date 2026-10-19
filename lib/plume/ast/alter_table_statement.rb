# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_altertable.html)**
	#
	# `action` is :RENAME_TABLE, :RENAME_COLUMN, :ADD_COLUMN or :DROP_COLUMN
	class AlterTableStatement < Node
		Action = _Union(:RENAME_TABLE, :RENAME_COLUMN, :ADD_COLUMN, :DROP_COLUMN)

		token :alter_table_kw
		token :action_kw # RENAME [COLUMN], ADD [COLUMN] or DROP [COLUMN]
		token :column_tk
		token :to_kw
		token :new_name_tk

		node :table, TableName
		attribute :action, Action
		node :column_definition, ColumnDefinition
		attribute :column, Stringy
		attribute :new_name, Stringy

		def self.new(*, table:, action:, **) = super
		def self.concrete(*, alter_table_kw:, table:, action:, **) = super

		def action = @action
		def column = (@column == LiteralNil) ? column_tk_val : @column
		def new_name = (@new_name == LiteralNil) ? new_name_tk_val : @new_name
	end
end
