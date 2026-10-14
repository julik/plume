# frozen_string_literal: true

module Plume
	# One `col = expr` or `(a, b) = expr` from a SET list
	class Assignment < Node
		token :columns_lp
		token :columns_rp
		token :eq_tk

		nodes :columns, ColumnName
		attr :value, Expression

		def self.new(*, columns:, value:, **) = super
		def self.concrete(*, columns:, value:, **) = super

		def value = @value
		def column_names = columns.map(&:column)
	end
end
