# frozen_string_literal: true

module Plume
	class JoinUsingConstraint < Node
		token :using_kw
		token :columns_lp
		token :columns_rp

		nodes :columns, ColumnName

		def self.new(*, columns:, **) = super
		def self.concrete(*, using_kw:, columns:, **) = super

		def column_names = columns.map(&:column)
	end
end
