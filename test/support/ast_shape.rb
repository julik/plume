# frozen_string_literal: true

# What a tree means, without how it was spelled: token positions, keyword case and
# redundant parentheses are left out, so a statement and its printed form compare equal.
#
# The shape is flat - the tree walked in order, with markers where nodes and lists open and
# close - and built without recursion, so neither building nor comparing two shapes needs a
# stack as deep as the tree. A long UNION ALL or OR chain is that deep, and a thread's stack
# is small. Markers are symbols, which no value in the shape is: symbols come out as strings
module AstShape
	extend self

	SKIPPED = %i[full_source leading trailing].freeze
	CLOSE = Object.new.freeze

	def of(value)
		shape = []
		pending = [value]
		until pending.empty?
			item = pending.pop
			case item
			when CLOSE then shape << :close
			when Label then shape << item.name
			when Plume::ParentheticalExpression
				inner = item.contents
				shape << :row unless Plume::Node === inner
				pending << inner
			when Plume::Node
				klass = item.class
				names = (klass.literal_properties.map(&:name) - klass.token_names.to_a - SKIPPED) | klass.all_inspectable_props.to_a
				shape << :node << klass.name
				pending << CLOSE
				names.reverse_each { |name| pending << read(item, name) << Label.new(name) }
			when Array
				shape << :list
				pending << CLOSE
				item.reverse_each { |element| pending << element }
			when Plume::LiteralNil then shape << nil
			when Symbol then shape << item.to_s.upcase
			else shape << item
			end
		end
		shape
	end

	Label = Data.define(:name)

	private

	def read(node, name)
		node.respond_to?(name) ? node.public_send(name) : node.instance_variable_get(:"@#{name}")
	end
end
