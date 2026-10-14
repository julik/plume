# frozen_string_literal: true

module Plume
	# A scalar subquery `(SELECT …)`, also the right side of `x IN (SELECT …)`
	class SubqueryExpression < Node
		token :select_lp
		token :select_rp

		node :select, SelectStatement

		def self.new(*, select:, **) = super
		def self.concrete(*, select:, **) = super
	end
end
