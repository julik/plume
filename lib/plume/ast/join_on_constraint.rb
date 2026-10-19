# frozen_string_literal: true

module Plume
	class JoinOnConstraint < Node
		token :on_kw

		node :expression, Expression

		def self.new(*, expression:, **) = super
		def self.concrete(*, on_kw:, expression:, **) = super
	end
end
