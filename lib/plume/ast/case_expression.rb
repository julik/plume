# frozen_string_literal: true

module Plume
	class CaseExpression < Node
		token :case_kw
		token :predicate_tk
		token :else_kw
		token :else_clause_tk
		token :end_kw

		attr :predicate, Expression
		attr :else_clause, Expression

		nodes :conditions, CaseCondition

		def self.new(*, conditions:, **) = super
		def self.concrete(*, case_kw:, conditions:, end_kw:, **) = super

		def predicate = (@predicate == LiteralNil) ? predicate_tk_val : @predicate
		def else_clause = (@else_clause == LiteralNil) ? else_clause_tk_val : @else_clause
	end
end
