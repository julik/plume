# frozen_string_literal: true

require_relative "support/authorizer_oracle"
require_relative "support/query_generator"

oracle = AuthorizerOracle.new(File.read(File.expand_path("../fixtures/schemas/rubyvideo/structure.sql", __dir__)))

cases = [1, 2, 3, 4].flat_map do |seed|
	generator = QueryGenerator.new(oracle.catalog, seed:)
	Array.new(200) do |i|
		sql = i.even? ? generator.query : generator.statement
		[seed, i, sql, oracle.reads(sql)]
	rescue SQLite3::Exception
		nil # the generator does produce the odd query SQLite rejects
	end.compact
end
# quickdraw forks its workers, which must not inherit an open connection
oracle.close

catalog = oracle.catalog

cases.each do |seed, i, sql, expected|
	test "seed #{seed} query #{i}: #{sql}" do
		problems = AuthorizerOracle.mismatches(expected, Plume.access(sql, catalog:))
		assert(problems.empty?) { problems.join("\n") }
	end
end
