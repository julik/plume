# frozen_string_literal: true

module Plume
	# **[SQLite Docs](https://www.sqlite.org/lang_explain.html)**
	class ExplainStatement < Node
		token :explain_kw # EXPLAIN or EXPLAIN QUERY PLAN

		node :statement, _Any

		def self.new(*, statement:, **) = super
		def self.concrete(*, explain_kw:, statement:, **) = super

		inspectable def query_plan = explain_kw_tok == [:EXPLAIN, :QUERY, :PLAN]
	end
end
