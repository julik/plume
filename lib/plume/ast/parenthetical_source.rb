# frozen_string_literal: true

module Plume
	# A parenthesized join or source list used as a FROM source, like `(a JOIN b) AS ab`
	class ParentheticalSource < Node
		token :source_lp
		token :source_rp
		token :as_kw
		token :alias_tk

		node :source, _Any
		attr :alias, Stringy

		def self.new(*, source:, **) = super
		def self.concrete(*, source:, **) = super

		def alias = (@alias == LiteralNil) ? alias_tk_val : @alias
	end
end
