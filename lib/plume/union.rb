# frozen_string_literal: true

module Plume
	# Literal's union looks every value up in a Set of its plain values before trying its types,
	# and from Ruby 4 on Set#include? hashes the value even when the set is empty. Hashing a node
	# (or an array of them) hashes the whole subtree, so type-checking a tree as it is built would
	# be quadratic. This union only looks up values that could be one of the plain ones
	class Union
		PLAIN = [String, Symbol, Integer, Float, Rational, Complex, TrueClass, FalseClass, NilClass].freeze

		def initialize(*members)
			plain, types = members.partition { |member| PLAIN.include?(member.class) }
			@plain = plain.to_set.freeze
			@types = types.freeze
			freeze
		end

		def ===(value)
			(PLAIN.include?(value.class) && @plain.include?(value)) || @types.any? { |type| type === value }
		end

		def inspect = "_Union(#{[*@plain, *@types].map(&:inspect).join(", ")})"

		module Types
			def _Union(*members) = Union.new(*members)
		end
	end
end
