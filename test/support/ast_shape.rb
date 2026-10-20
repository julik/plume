# frozen_string_literal: true

# What a tree means, without how it was spelled: token positions, keyword case and
# redundant parentheses are left out, so a statement and its printed form compare equal.
#
# The shape is flat - the tree walked in order - and built without recursion, so neither building
# nor comparing two shapes needs a stack as deep as the tree. A long UNION ALL or OR chain is that
# deep, and a thread's stack is small. A node's class - the class itself, which no value can equal -
# fixes which fields follow it, each named for readable failures, and a list gives its length first
module AstShape
	extend self

	SKIPPED = %i[full_source leading trailing].freeze

	# The fields of each node class, in the order they are walked
	FIELDS = Hash.new do |fields, klass|
		names = (klass.literal_properties.map(&:name) - klass.token_names.to_a - SKIPPED) | klass.all_inspectable_props.to_a
		fields[klass] = names.reverse.freeze
	end

	def of(value)
		shape = []
		pending = [value]
		until pending.empty?
			case (item = pending.pop)
			when Plume::ParentheticalExpression
				inner = item.contents
				shape << :row unless Plume::Node === inner
				pending << inner
			when Plume::Node
				shape << item.class
				FIELDS[item.class].each { |name| pending << read(item, name) << name.name }
			when Array
				shape << :list << item.size
				item.reverse_each { |element| pending << element }
			when Plume::LiteralNil then shape << nil
			when Symbol then shape << item.to_s.upcase
			else shape << item
			end
		end
		shape
	end

	private

	def read(node, name)
		node.respond_to?(name) ? node.public_send(name) : node.instance_variable_get(:"@#{name}")
	end
end
