# frozen_string_literal: true

require "digest"

# What kind of statement a piece of SQL is, so bin/trace-fixtures can keep one of each. The tree
# drops names and values, collapses each list to the set of its element shapes, and keeps every
# token's type - so a column named `window` is a different shape from one named `x`. SQL Plume
# cannot parse falls back to its token types, with repeats collapsed
module FixtureShape
	extend self

	SKIPPED = %i[@full_source @leading @trailing].freeze

	def key(sql)
		Digest::SHA1.hexdigest(tree(Plume.parse(sql)).inspect)
	rescue
		Digest::SHA1.hexdigest("tokens: #{tokens(sql).inspect}")
	end

	def tree(value)
		case value
		when Plume::Node
			parts = value.instance_variables.sort.filter_map do |ivar|
				next if SKIPPED.include?(ivar)

				shape = tree(value.instance_variable_get(ivar))
				[ivar, shape] unless shape.nil?
			end
			[value.class.name, parts]
		when Array
			(Plume::Token === value) ? Array(value.first) : value.map { |v| tree(v) }.uniq.sort_by(&:inspect)
		when Plume::LiteralNil, nil then nil
		when Symbol then value
		else value.class.name
		end
	end

	def tokens(sql)
		Plume.tokenize(sql).chunk_while { |a, b| a == b }.map(&:first)
	rescue
		[]
	end
end
