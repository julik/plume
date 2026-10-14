# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_createvtab.html)**
	#
	# Module arguments are free-form - every module has its own syntax for them - so they
	# are kept as the source text between the commas
	class CreateVirtualTableStatement < Node
		token :create_virtual_table_kw
		token :if_not_exists_kw
		token :using_kw
		token :module_tk
		token :arguments_lp
		token :arguments_rp

		node :table, TableName
		attr :module_name, Stringy
		attr :arguments, _Array(String)

		def self.new(*, table:, module_name:, **) = super
		def self.concrete(*, create_virtual_table_kw:, table:, module_tk:, **) = super

		def module_name = (@module_name == LiteralNil) ? module_tk_val : @module_name
		def arguments = (@arguments.nil? || LiteralNil.equal?(@arguments)) ? [] : @arguments

		inspectable def if_not_exists = if_not_exists_kw?
	end
end
