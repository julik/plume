# frozen_string_literal: true

module Plume
	class Join < Node
		node :operator, JoinOperator
		node :source, _Any
		node :constraint, _Union(JoinOnConstraint, JoinUsingConstraint)

		def self.new(*, operator:, source:, **) = super
		def self.concrete(*, operator:, source:, **) = super
	end
end
