# frozen_string_literal: true

require_relative "support/fixture_corpus"
require_relative "support/ast_shape"

# Only fixtures recorded in fixtures/passing.txt are held to parsing - run
# `bin/fixture-report --write` to move the ratchet once more of them parse.
# Each must also survive the trip back to SQL: printing and parsing again gives the same tree
FixtureCorpus.baseline.each do |path|
	test path do
		sql = FixtureCorpus.read(path)
		statements = Plume::Parser.new(sql).parse
		printed = statements.map(&:to_sql).join(";\n")
		reparsed = Plume::Parser.new(printed).parse

		assert_equal AstShape.of(reparsed), AstShape.of(statements)
	end
end
