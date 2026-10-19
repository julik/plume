# frozen_string_literal: true

module Plume
	# DROP TABLE, DROP INDEX, DROP VIEW and DROP TRIGGER, told apart by `type`
	#
	# **[SQLite Docs](https://www.sqlite.org/lang_droptable.html)**
	class DropStatement < Node
		token :drop_kw
		token :type_kw
		token :if_exists_kw

		node :target, TableName

		def self.new(*, target:, **) = super
		def self.concrete(*, drop_kw:, type_kw:, target:, **) = super

		# :TABLE, :INDEX, :VIEW or :TRIGGER
		inspectable def type = type_kw_tok
		inspectable def if_exists = if_exists_kw?
	end
end
