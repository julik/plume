# frozen_string_literal: true

module Plume
	# A table-valued function used as a FROM source, like `json_each(doc) AS j`
	class TableFunction < Node
		token :schema_tk
		token :dot_tk
		token :function_tk
		token :arguments_lp
		token :arguments_rp
		token :as_kw
		token :alias_tk

		attribute :schema, Stringy
		attribute :function, Stringy
		nodes :arguments, Expression
		attribute :alias, Stringy

		def self.new(*, function:, **) = super
		def self.concrete(*, function_tk:, **) = super

		def schema = (@schema == LiteralNil) ? schema_tk_val : @schema
		def function = (@function == LiteralNil) ? function_tk_val : @function
		def alias = (@alias == LiteralNil) ? alias_tk_val : @alias

		alias_method :name, :function
	end
end
