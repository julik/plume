# frozen_string_literal: true

module Plume
	# `[NOT] DEFERRABLE [INITIALLY DEFERRED | INITIALLY IMMEDIATE]` on its own among a column's
	# constraints, where SQLite's grammar allows it (`ccons ::= defer_subclause`)
	class DeferrableColumnConstraint < ColumnConstraint
		token :constraint_kw
		token :name_tk
		token :deferrable_span

		attribute :name, Stringy
		attribute :deferred, ForeignKeyClause::Deferrable

		def self.new(*, **) = super
		def self.concrete(*, deferrable_span:, **) = super

		def name = (@name == LiteralNil) ? name_tk_val : @name
		def deferred = (@deferred == LiteralNil) ? ForeignKeyClause::TOKEN_TO_DEFERRABLE[deferrable_span_tok] : @deferred
	end
end
