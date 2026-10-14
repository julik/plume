# frozen_string_literal: true

module Plume
	class JoinOnConstraint < Node
		token :on_kw

		attr :expression, Expression

		def self.new(*, expression:, **) = super
		def self.concrete(*, on_kw:, expression:, **) = super

		def expression = @expression
	end
end
