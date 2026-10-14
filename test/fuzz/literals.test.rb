# frozen_string_literal: true

require "sqlite3"
require_relative "../support/fuzz"
require_relative "../support/ast_shape"

# Literals SQLite has opinions about: strings full of quotes and odd bytes, numbers with
# separators, exponents and more digits than fit in 64 bits, hex, blobs of odd length. We
# accept what SQLite accepts, give each literal the value SQLite gives it, and print it back
# so that SQLite still reads the same value
module LiteralFuzz
	extend self

	STRING_PIECES = ["'", "''", '"', "`", "a", "é", "表", "🙂", "\n", "\r\n", "\t", " ", "\\", "%", "_", "--", "/*", "*/", "x'00'", "\xFF".b, "\xC3".b].freeze
	DIGITS = ("0".."9").to_a.freeze
	HEX_DIGITS = (DIGITS + ("a".."f").to_a + ("A".."F").to_a).freeze

	def string(random)
		body = Array.new(random.rand(0..8)) { STRING_PIECES.sample(random:) }.map(&:b).join
		"'#{body.gsub("'".b, "''".b)}'".force_encoding(Encoding::UTF_8).then { |s| random.rand(4).zero? ? s.sub("''", "'") : s }
	end

	def digits(random, from, count = random.rand(1..25))
		Array.new(count) { from.sample(random:) }.join.then { |d| separators(d, random) }
	end

	# Mostly where they belong, now and then where they do not
	def separators(digits, random)
		return digits unless random.rand(3).zero?

		at = random.rand(0..digits.size)
		digits.dup.insert(at, random.rand(4).zero? ? "__" : "_")
	end

	def number(random)
		case random.rand(5)
		when 0 then "0x#{digits(random, HEX_DIGITS, random.rand(1..20))}"
		when 1 then digits(random, DIGITS)
		when 2 then "#{digits(random, DIGITS)}.#{digits(random, DIGITS, random.rand(0..20))}"
		when 3 then "#{random.rand(2).zero? ? "" : digits(random, DIGITS)}.#{digits(random, DIGITS)}"
		else "#{digits(random, DIGITS, random.rand(1..18))}#{%w[e E e+ e- E-].sample(random:)}#{digits(random, DIGITS, random.rand(1..3))}"
		end
	end

	def blob(random)
		"#{%w[x X].sample(random:)}'#{Array.new(random.rand(0..9)) { (HEX_DIGITS + %w[g z]).sample(random:) }.join}'"
	end

	def literal(random) = [method(:string), method(:number), method(:number), method(:blob)].sample(random:).call(random)

	def verdict(db, sql)
		[:ok, db.execute(sql).first.first]
	rescue SQLite3::Exception => e
		[Fuzz.sqlite_syntax_error?(e) ? :syntax : :unknown, e.message]
	end

	def db = @db ||= SQLite3::Database.new(":memory:")

	def value(literal) = Plume.parse("SELECT #{literal}").first.body.columns.first.result.then { |e| e.respond_to?(:value) ? e.value : e }

	# SQLite turns an integer that does not fit in 64 bits into a REAL, we keep it whole - the
	# number is still the same one. With more digits than a double holds, sqlite3AtoF can land a
	# unit in the last place away from the correctly rounded value Ruby gives us, so that much is
	# let go. Blobs come back from the sqlite3 gem as binary strings
	def same?(ours, theirs)
		case [ours, theirs]
		in [Integer | Float, Float] then ours.to_f == theirs || (ours.to_f - theirs).abs <= theirs.abs * Float::EPSILON
		in [String, String] then ours.b == theirs.b
		else ours == theirs
		end
	end
end

random = Fuzz.random("literals")
db = SQLite3::Database.new(":memory:")
# A sign makes it an expression, so the value we compare is that of the literal without it
LITERAL_CASES = Array.new(Fuzz.iterations(5000)) do
	literal = LiteralFuzz.literal(random)
	sign = random.rand(4).zero? ? "-" : ""
	[sign + literal, *LiteralFuzz.verdict(db, "SELECT #{sign}#{literal}"), LiteralFuzz.verdict(db, "SELECT #{literal}").last]
end.freeze
db.close

LITERAL_CASES.each_with_index do |(literal, sqlite, expected, unsigned), i|
	test "literal #{i}: #{Fuzz.describe(literal)}" do
		sql = "SELECT #{literal}"
		parsed = Fuzz.exception_from { Plume.parse(sql) }
		ours = parsed.nil? ? :ok : :syntax
		assert(Plume::SyntaxError === parsed || parsed.nil?) { "parsing raised #{parsed.inspect}, #{Fuzz.replay}" }
		assert(sqlite == :unknown || ours == sqlite) { "SQLite says #{sqlite} (#{expected.inspect}), we say #{ours}, #{Fuzz.replay}" }
		next unless ours == :ok

		statement = Plume.parse(sql).first
		printed = statement.to_sql
		assert_equal AstShape.of(Plume.parse(printed)), AstShape.of([statement])
		next unless sqlite == :ok

		value = LiteralFuzz.value(literal.delete_prefix("-"))
		assert(LiteralFuzz.same?(value, unsigned)) { "we read #{value.inspect}, SQLite #{unsigned.inspect}, #{Fuzz.replay}" }
		reprinted = LiteralFuzz.db.execute(printed).first.first
		assert(LiteralFuzz.same?(reprinted, expected)) { "#{printed.inspect} is #{reprinted.inspect} to SQLite, not #{expected.inspect}" }
	end
end
