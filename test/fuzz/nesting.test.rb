# frozen_string_literal: true

require "sqlite3"
require_relative "../support/fuzz"
require_relative "../support/ast_shape"

# Expressions built by nesting random constructs inside each other, up to well past SQLite's
# limit of 1000. Whatever the depth, we parse, print and analyze them or raise NestingTooDeep -
# never SystemStackError. Shallow enough to fit any stack, what SQLite takes we take too
module NestingFuzz
	extend self

	WRAPPERS = [
		->(e) { "(#{e})" },
		->(e) { "- #{e}" }, # with the space, or two of them start a comment
		->(e) { "NOT #{e}" },
		->(e) { "abs(#{e})" },
		->(e) { "coalesce(#{e}, 1)" },
		->(e) { "CASE WHEN #{e} THEN 1 ELSE 0 END" },
		->(e) { "CASE #{e} WHEN 1 THEN 2 END" },
		->(e) { "(SELECT #{e})" },
		->(e) { "EXISTS (SELECT #{e})" },
		->(e) { "1 IN (#{e}, 2)" },
		->(e) { "#{e} + 1" },
		->(e) { "1 * #{e}" },
		->(e) { "#{e} || 'x'" },
		->(e) { "#{e} AND a" },
		->(e) { "#{e} COLLATE nocase" },
		->(e) { "CAST(#{e} AS INT)" },
		->(e) { "#{e} BETWEEN 1 AND 2" },
		->(e) { "#{e} IS NOT NULL" },
		->(e) { "max(#{e}) OVER ()" },
	].freeze

	# The deepest anything gets on a 1 MB stack with the analysis included, 170 nested subqueries,
	# with room to spare
	FITS_ANY_STACK = 120

	def expression(random, depth) = Array.new(depth) { WRAPPERS.sample(random:) }.reduce("a") { |e, wrap| wrap.(e) }
end

random = Fuzz.random("nesting")
db = SQLite3::Database.new(":memory:")
db.execute("CREATE TABLE t (a)")
NESTING_CASES = Array.new(Fuzz.iterations(300)) do |i|
	depth = i.even? ? random.rand(1..NestingFuzz::FITS_ANY_STACK) : random.rand(1..1500)
	sql = "SELECT #{NestingFuzz.expression(random, depth)} FROM t"
	sqlite = begin
		db.prepare(sql).close
		:ok
	rescue SQLite3::Exception
		:error
	end
	[depth, sql, sqlite]
end.freeze
db.close

CATALOG = Plume::Catalog.from_sql("CREATE TABLE t (a)")

NESTING_CASES.each_with_index do |(depth, sql, sqlite), i|
	test "nesting #{i}: #{depth} levels, #{Fuzz.describe(sql)}" do
		statements = nil
		error = Fuzz.exception_from { statements = Plume.parse(sql) }
		assert(error.nil? || Plume::NestingTooDeep === error) { "parsing raised #{error.inspect}, #{Fuzz.replay}" }
		assert(error.nil?) { "SQLite takes #{depth} levels, we do not, #{Fuzz.replay}" } if sqlite == :ok && depth <= NestingFuzz::FITS_ANY_STACK
		next if error

		printed = nil
		error = Fuzz.exception_from { printed = statements.first.to_sql }
		assert(error.nil? || Plume::NestingTooDeep === error) { "printing raised #{error.inspect}, #{Fuzz.replay}" }
		assert_equal AstShape.of(Plume.parse(printed)), AstShape.of(statements) if printed && depth <= NestingFuzz::FITS_ANY_STACK

		error = Fuzz.exception_from { Plume.access(statements.first, catalog: CATALOG, strict: false) }
		assert(error.nil? || Plume::NestingTooDeep === error) { "analysis raised #{error.inspect}, #{Fuzz.replay}" }
	end
end
