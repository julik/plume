# frozen_string_literal: true

module Plume
	# `EXISTS (SELECT …)`. `NOT EXISTS` is a `UnaryExpression` wrapping this
	class ExistsExpression < Node
		token :exists_kw
		token :select_lp
		token :select_rp

		node :select, SelectStatement

		def self.new(*, select:, **) = super
		def self.concrete(*, select:, **) = super
	end
end
