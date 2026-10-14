# frozen_string_literal: true

module Plume
	# `ON CONFLICT [(target) [WHERE …]] DO NOTHING | DO UPDATE SET … [WHERE …]`
	class UpsertClause < Node
		token :on_conflict_kw
		token :target_lp
		token :target_rp
		token :target_where_kw
		token :do_kw
		token :action_kw
		token :set_kw
		token :where_kw

		nodes :targets, OrderingTerm
		attr :target_condition, Expression
		nodes :assignments, Assignment
		attr :condition, Expression

		def self.new(*, **) = super
		def self.concrete(*, on_conflict_kw:, action_kw:, **) = super

		def target_condition = (@target_condition == LiteralNil) ? nil : @target_condition
		def condition = (@condition == LiteralNil) ? nil : @condition

		# :NOTHING or :UPDATE
		inspectable def action = action_kw_tok
	end
end
