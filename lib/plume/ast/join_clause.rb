# frozen_string_literal: true

module Plume
	# `left` followed by one or more joins. Comma-separated sources are joins too,
	# with a `:COMMA` operator
	class JoinClause < Node
		node :left, _Any
		nodes :joins, Join

		def self.new(*, left:, joins:, **) = super
		def self.concrete(*, left:, joins:, **) = super

		def sources = [left, *joins.map(&:source)]
	end
end
