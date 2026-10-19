# frozen_string_literal: true

module Plume
	# A parenthesized select used as a FROM source, like `(SELECT …) AS s`
	class SubquerySource < Node
		token :select_lp
		token :select_rp
		token :as_kw
		token :alias_tk

		node :select, SelectStatement
		attribute :alias, Stringy

		def self.new(*, select:, **) = super
		def self.concrete(*, select:, **) = super

		def alias = (@alias == LiteralNil) ? alias_tk_val : @alias
	end
end
