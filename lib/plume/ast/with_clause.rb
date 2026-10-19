# frozen_string_literal: true

module Plume
	class WithClause < Node
		token :with_kw
		token :recursive_kw

		nodes :ctes, CommonTableExpression

		def self.new(*, ctes:, **) = super
		def self.concrete(*, with_kw:, ctes:, **) = super

		inspectable def recursive = recursive_kw?
	end
end
