# frozen_string_literal: true

# What a tree means, without how it was spelled: token positions, keyword case and
# redundant parentheses are left out, so a statement and its printed form compare equal
module AstShape
	extend self

	SKIPPED = %i[full_source leading trailing].freeze

	def of(value)
		case value
		when Plume::ParentheticalExpression
			inner = value.instance_variable_get(:@value)
			Plume::Node === inner ? of(inner) : [:row, of(inner)]
		when Plume::Node
			klass = value.class
			names = (klass.literal_properties.map(&:name) - klass.token_names.to_a - SKIPPED) | klass.all_inspectable_props.to_a
			[klass.name, names.to_h { |name| [name, of(read(value, name))] }]
		when Array then value.map { |v| of(v) }
		when Plume::LiteralNil then nil
		when Symbol then value.to_s.upcase
		else value
		end
	end

	private

	def read(node, name)
		node.respond_to?(name) ? node.public_send(name) : node.instance_variable_get(:"@#{name}")
	end
end
