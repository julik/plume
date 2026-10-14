# frozen_string_literal: true

require "zlib"
require "timeout"
require_relative "fixture_corpus"

# Seeds, budgets and input generators for the fuzz tests.
#
# Everything random is derived from one seed, so a failure replays with `SEED=1234 bundle exec
# rake test`. Quickdraw has a --seed of its own, but does not print it or hand it to tests yet
# (see llm/outputs/quickdraw-seed.md), so we take SEED ourselves. The inputs are generated when
# the test files load, which quickdraw does in the parent process before forking its workers -
# every worker sees the same cases.
module Fuzz
	extend self

	def seed
		@seed ||= Integer(ENV.fetch("SEED") { quickdraw_seed || Random.new_seed % 2**32 })
	end

	# How many cases each fuzzer generates, FUZZ_ITERATIONS=50000 for a long local run
	def iterations(default) = Integer(ENV.fetch("FUZZ_ITERATIONS", default))

	# One stream per fuzzer, so adding a fuzzer does not reshuffle what the others generate
	def random(name) = Random.new(seed ^ Zlib.crc32(name))

	def replay = "replay with SEED=#{seed}#{ENV["FUZZ_ITERATIONS"] && " FUZZ_ITERATIONS=#{ENV["FUZZ_ITERATIONS"]}"}"

	def describe(input) = input.inspect[0, 120]

	# Runs the block and returns what it raised, or nil. Parsing a few kilobytes has no business
	# taking seconds, so running out of time counts as a failure too
	def exception_from(seconds: 5)
		Timeout.timeout(seconds) { yield }
		nil
	rescue Exception => e # rubocop:disable Lint/RescueException
		e
	end

	# SQL that SQLite refuses to parse, as opposed to SQL that parses and then names a
	# table or a function that does not exist
	def sqlite_syntax_error?(error) = error.message.match?(FixtureCorpus::SQLITE_SYNTAX_ERROR)

	# Statements from the fixtures that we parse, picked at random
	def fixture_statements(random, count)
		FixtureCorpus.baseline.sample(count, random:).flat_map do |path|
			FixtureCorpus.statements(FixtureCorpus.read(path))
		end
	ensure
		FixtureCorpus.close_sqlite
	end

	SQL_PIECES = [
		"'", '"', "`", "[", "]", "(", ")", ",", ";", ".", "*", "-", "--", "/*", "*/", "||", "->>", "x'",
		"0x", "1_", "_", "e", "$", ":", "@", "?", "?1", "#", "\0", "\n", "\xEF\xBB\xBF", "\u00A0", "\u200D",
		"é", "表", "🙂", "SELECT", "FROM", "WHERE", "CASE", "END", "NOT", "NULL", "AND", "OR", "IN", "IS",
		"BETWEEN", "LIKE", "ESCAPE", "COLLATE", "AS", "ON", "JOIN", "WITH", "RECURSIVE", "OVER", "FILTER",
		"VALUES", "DEFAULT", "RETURNING", "ROWID", "KEY", "excluded",
	].map(&:b).freeze

	def random_bytes(random) = random.bytes(random.rand(0..64))

	def random_utf8(random)
		Array.new(random.rand(0..32)) do
			case random.rand(4)
			when 0 then random.rand(0x20..0x7E)
			when 1 then random.rand(0x80..0x7FF)
			when 2 then random.rand(0x800..0xD7FF)
			else random.rand(0x10000..0x10FFFF)
			end.chr(Encoding::UTF_8)
		end.join
	end

	def mutate_bytes(sql, random)
		sql = sql.b
		random.rand(1..3).times do
			at = random.rand(0..sql.bytesize)
			case random.rand(6)
			when 0 then sql = sql.byteslice(0, at) + sql.byteslice(at + 1..).to_s
			when 1 then sql = sql.byteslice(0, at) + random.bytes(1) + sql.byteslice(at..).to_s
			when 2 then sql = sql.byteslice(0, at) + SQL_PIECES.sample(random:) + sql.byteslice(at..).to_s
			when 3
				from, to = [at, random.rand(0..sql.bytesize)].minmax
				sql = sql.byteslice(0, at) + sql.byteslice(from, to - from).to_s + sql.byteslice(at..).to_s
			when 4 then sql = sql.byteslice(0, at)
			else sql = sql.byteslice(at..).to_s
			end
		end
		sql
	end

	# Delete, duplicate, swap or insert whole tokens, so the result still looks like SQL
	def mutate_tokens(sql, random, pieces: SQL_PIECES)
		tokens = Plume.tokenize(sql, with_values: true, skip_spaces: false).map(&:last)
		random.rand(1..2).times do
			at = random.rand(0..tokens.size)
			case random.rand(4)
			when 0 then tokens.delete_at(at)
			when 1 then tokens.insert(at, tokens.sample(random:).to_s)
			when 2 then tokens.insert(at, " #{pieces.sample(random:)} ")
			else
				other = random.rand(0...[tokens.size, 1].max)
				tokens[at], tokens[other] = tokens[other], tokens[at] if at < tokens.size
			end
		end
		tokens.compact.map(&:b).join.force_encoding(Encoding::UTF_8)
	end

	# The same bytes in an encoding other than UTF-8, or with an encoding that does not fit them
	def reencode(sql, random)
		case random.rand(5)
		when 0 then sql.b
		when 1 then sql.encode(Encoding::UTF_16LE, invalid: :replace, undef: :replace)
		when 2 then sql.encode(Encoding::UTF_16BE, invalid: :replace, undef: :replace).b.force_encoding(Encoding::UTF_16LE)
		when 3 then sql.b.force_encoding(Encoding::US_ASCII)
		else sql.b.force_encoding(Encoding::Shift_JIS)
		end
	end

	NAME_PIECES = [
		" ", "\t", "\n", "\u00A0", "\u200B", "\u200D", "e\u0301", "é", "É", "ä", "Ä", "ß", "ı", "İ", "表", "名前", "🙂",
		"👩\u200D💻", "שלום", "مرحبا", '"', '""', "'", "''", "`", "``", "[", "]", "[x]", "--x", "/*", "*/", "a-b", "a.b",
		"a;b", "a,b", "(", ")", "$a", ":a", "@a", "?", "?1", "#a", "1", "12abc", "0x1", "1e5", "_", "x'00'", "a",
	].freeze
	SPECIAL_NAMES = %w[excluded rowid oid _rowid_ ROWID main temp KEY END x y].freeze

	# Table, column, alias and index names nobody should use but SQLite takes. No NUL though,
	# SQLite reads no further than one
	def crazy_name(random)
		case random.rand(8)
		when 0 then Plume::Lexer::KEYWORDS.to_a.sample(random:).to_s.then { |kw| random.rand(2).zero? ? kw.downcase : kw }
		when 1 then SPECIAL_NAMES.sample(random:)
		when 2 then NAME_PIECES.sample(random:) * random.rand(50..200)
		when 3 then ""
		else Array.new(random.rand(1..3)) { NAME_PIECES.sample(random:) }.join
		end
	end

	# Quoted every way SQLite knows, or not quoted at all when it does not have to be
	def quote_name(name, random)
		bare = name.match?(/\A[A-Za-z_\u0080-\u{10FFFF}][A-Za-z0-9_$\u0080-\u{10FFFF}]*\z/)
		case random.rand(4)
		when 0 then bare ? name : %("#{name.gsub('"', '""')}")
		when 1 then name.include?("]") ? %("#{name.gsub('"', '""')}") : "[#{name}]"
		when 2 then "`#{name.gsub("`", "``")}`"
		else %("#{name.gsub('"', '""')}")
		end
	end

	private

	def quickdraw_seed = Quickdraw.respond_to?(:seed) ? Quickdraw.seed : nil
end

puts "Fuzzing with SEED=#{Fuzz.seed}"
