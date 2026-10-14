# frozen_string_literal: true

module Plume
	class NoOpColumnConstraint < ColumnConstraint
		token :constraint_kw
		token :name_tk
		token :deferrable_span

		attr :name, Stringy

		def self.new(*, **) = super
		def self.concrete(*, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
	end
end
