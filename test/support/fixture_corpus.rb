# frozen_string_literal: true

module FixtureCorpus
	extend self

	ROOT = File.expand_path("../..", __dir__)
	BASELINE_PATH = File.join(ROOT, "fixtures/passing.txt")

	def paths
		Dir.glob("fixtures/**/*.sql", base: ROOT).sort
	end

	def read(path)
		File.read(File.join(ROOT, path))
	end

	def classify(path)
		statements = Plume::Parser.new(read(path)).parse
		statements.all?(Plume::Node) ? :pass : :fail
	rescue Plume::NotImplementedError
		:not_implemented
	rescue StandardError, SystemStackError
		:fail
	end

	def leading_keyword(path)
		Plume.tokenize(read(path)).first || :EMPTY
	rescue StandardError
		:UNLEXABLE
	end

	def baseline
		File.exist?(BASELINE_PATH) ? File.readlines(BASELINE_PATH, chomp: true) : []
	end
end
