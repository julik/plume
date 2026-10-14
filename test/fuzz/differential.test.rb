# frozen_string_literal: true

require "sqlite3"
require_relative "../support/fuzz"

# Mutated statements from the fixtures, and SQLite as the judge of which of them are SQL: what
# SQLite parses we parse, and what it rejects as malformed we reject too. SQLite does some name
# resolution while it parses, so "no such table" and the like tell us nothing about the syntax -
# only statements it prepares cleanly or calls a syntax error count
module SQLiteVerdict
	extend self

	# Statement by statement, the way sqlite3_exec goes through a string. A closed statement is
	# what the sqlite3 gem gives back when only spaces, comments or semicolons were left
	def of(db, sql)
		rest = sql
		until rest.nil? || rest.empty?
			statement = db.prepare(rest)
			break if statement.closed?

			rest = statement.remainder
			statement.close
		end
		:ok
	rescue SQLite3::Exception => e
		Fuzz.sqlite_syntax_error?(e) ? :syntax : :unknown
	end

	# Disagreements by design, each one also covered by a regular test
	def by_design?(sql)
		# SQLite stops reading at a NUL as if the SQL ended there, we refuse the NUL
		sql.include?("\0")
	end

	def plume(sql)
		Plume.parse(sql)
		:ok
	rescue Plume::SyntaxError
		:syntax
	end
end

random = Fuzz.random("differential")
db = SQLite3::Database.new(":memory:")
seeds = Fuzz.fixture_statements(random, 600).select { |sql| SQLiteVerdict.of(db, sql) == :ok && SQLiteVerdict.plume(sql) == :ok }

DIFFERENTIAL_CASES = Array.new(Fuzz.iterations(6000)) do |i|
	seed = seeds.sample(random:)
	sql = i.odd? ? Fuzz.mutate_tokens(seed, random) : Fuzz.mutate_bytes(seed, random).force_encoding(Encoding::UTF_8)
	verdict = SQLiteVerdict.of(db, sql)
	[sql, verdict] unless verdict == :unknown || SQLiteVerdict.by_design?(sql)
end.compact.freeze
db.close

DIFFERENTIAL_CASES.each_with_index do |(sql, sqlite), i|
	test "differential #{i}: #{Fuzz.describe(sql)}" do
		ours = SQLiteVerdict.plume(sql)
		assert(ours == sqlite) { "SQLite says #{sqlite}, we say #{ours} for #{sql.inspect}, #{Fuzz.replay}" }
	end
end
