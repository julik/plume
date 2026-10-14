# frozen_string_literal: true

module Plume
	class ValuesRow < Node
		token :row_lp
		token :row_rp

		nodes :values, Expression

		def self.new(*, values:, **) = super
		def self.concrete(*, values:, **) = super
	end
end
