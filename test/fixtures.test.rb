# frozen_string_literal: true

require_relative "support/fixture_corpus"

# Only fixtures recorded in fixtures/passing.txt are held to parsing - run
# `bin/fixture-report --write` to move the ratchet once more of them parse.
# Each must also survive the trip back to SQL: printing and parsing again gives the same tree
FixtureCorpus.baseline.each do |path|
	test path do
		round_trip(FixtureCorpus.read(path))
	end
end

# And the ones SQLite rejects as malformed, recorded in fixtures/rejected.txt, are held to a SyntaxError
FixtureCorpus.rejected.each do |path|
	test path do
		assert_raises(Plume::SyntaxError) { Plume.parse(FixtureCorpus.read(path)) }
	end
end
