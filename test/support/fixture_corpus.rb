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
	rescue StandardError, SystemStackError
		:fail
	end

	def leading_keyword(path)
		Plume.tokenize(read(path)).first || :EMPTY
	rescue StandardError
		:UNLEXABLE
	end

	SQLITE_SYNTAX_ERROR = /syntax error|unrecognized token|incomplete input/

	# Whether SQLite itself rejects the fixture as malformed - the corpus comes from SQLite's
	# test suite, which feeds it plenty of deliberately broken SQL. Statements are prepared one
	# at a time, since a "no such table" in one would otherwise stop us from checking the next
	def sqlite_rejects?(path)
		statements(read(path)).any? do |sql|
			sqlite.prepare(sql).close
			false
		rescue SQLite3::Exception => e
			e.message.match?(SQLITE_SYNTAX_ERROR)
		end
	end

	# sqlite3_complete knows that semicolons inside a trigger body do not end the statement
	def statements(sql)
		chunks = []
		buffer = +""
		sql.split(/(?<=;)/).each do |piece|
			buffer << piece
			next unless sqlite.complete?(buffer)

			chunks << buffer
			buffer = +""
		end
		chunks << buffer unless buffer.strip.empty?
		chunks.reject { |c| c.gsub(/--[^\n]*/, "").strip.delete(";").empty? }
	end

	def sqlite
		require "sqlite3"
		@sqlite ||= SQLite3::Database.new(":memory:")
	end

	def baseline
		File.exist?(BASELINE_PATH) ? File.readlines(BASELINE_PATH, chomp: true) : []
	end
end
