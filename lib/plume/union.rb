# frozen_string_literal: true

module Plume
	# Literal's union looks plain values up in a Set before trying its types, and from Ruby 4 on
	# Set#include? hashes the value even when the set is empty. Hashing a node hashes its whole
	# subtree, so every type check up a tree would make building it quadratic. A node is never
	# one of the plain values, so it goes straight to the types
	class Union < Literal::Types::UnionType
		def ===(value)
			return true if !(Node === value) && primitives.include?(value)

			types.any? { |type| type === value }
		end

		module Types
			def _Union(*types) = Union.new(*types)
		end
	end
end
