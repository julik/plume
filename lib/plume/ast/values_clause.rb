# frozen_string_literal: true

module Plume
	class ValuesClause < Node
		token :values_kw

		nodes :rows, ValuesRow

		def self.new(*, rows:, **) = super
		def self.concrete(*, values_kw:, rows:, **) = super
	end
end
