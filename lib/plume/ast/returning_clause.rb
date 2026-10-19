# frozen_string_literal: true

module Plume
	class ReturningClause < Node
		token :returning_kw

		nodes :columns, _Union(ResultColumn, StarResultColumn)

		def self.new(*, columns:, **) = super
		def self.concrete(*, returning_kw:, columns:, **) = super
	end
end
