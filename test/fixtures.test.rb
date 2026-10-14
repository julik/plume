# frozen_string_literal: true

# Eventually, we should test a round-trip SQL -> AST -> SQL -> AST

require_relative "support/fixture_corpus"

# Only fixtures recorded in fixtures/passing.txt are held to parsing - run
# `bin/fixture-report --write` to move the ratchet once more of them parse
FixtureCorpus.baseline.each do |path|
	test path do
		status = FixtureCorpus.classify(path)
		assert(status == :pass) { "expected #{path} to parse, got #{status}:\n#{FixtureCorpus.read(path)}" }
	end
end
