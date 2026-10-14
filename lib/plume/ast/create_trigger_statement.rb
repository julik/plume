# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_createtrigger.html)**
	class CreateTriggerStatement < Node
		token :create_kw
		token :temp_kw
		token :trigger_kw
		token :if_not_exists_kw
		token :time_kw # BEFORE, AFTER or INSTEAD OF
		token :event_kw # DELETE, INSERT, UPDATE or UPDATE OF
		token :on_kw
		token :for_each_row_kw
		token :when_kw
		token :begin_kw
		token :end_kw

		node :trigger, TableName
		nodes :columns, ColumnName
		node :table, TableName
		attr :condition, Expression
		nodes :statements, _Any

		def self.new(*, trigger:, table:, statements:, **) = super
		def self.concrete(*, create_kw:, trigger_kw:, trigger:, table:, statements:, **) = super

		def condition = (@condition == LiteralNil) ? nil : @condition

		inspectable def temporary = temp_kw?
		inspectable def if_not_exists = if_not_exists_kw?

		# :BEFORE, :AFTER, :INSTEAD_OF, or nil (which SQLite treats as BEFORE)
		inspectable def time
			case time_kw_tok
			when :BEFORE then :BEFORE
			when :AFTER then :AFTER
			when [:INSTEAD, :OF] then :INSTEAD_OF
			end
		end

		# :DELETE, :INSERT or :UPDATE
		inspectable def event = Array(event_kw_tok).first
		def column_names = columns&.map(&:column)
	end
end
