# frozen_string_literal: true

SPACE_TOKENS = [
	[" ", :SPACE],
	["\t", :SPACE],
	["\n", :SPACE],
	["\f", :SPACE],
	["\r", :SPACE],
	[" \t\n\f\r", :SPACE],
	["--", :SPACE],
	["-- inline comment", :SPACE],
	["/* single line comment */", :SPACE],
	["/* multi-line\ncomment */", :SPACE],
	["\xEF\xBB\xBF", :SPACE],
	["\x09", :SPACE],
	["\x0A", :SPACE],
	["\x0C", :SPACE],
	["\x0D", :SPACE],
].freeze

ILLEGAL_TOKENS = [
	['"', :ILLEGAL],
	["`", :ILLEGAL],
	["[abc", :ILLEGAL],
	["'a\0", :ILLEGAL],
	["\"a\0", :ILLEGAL],
	["[a\0", :ILLEGAL],
	["[abc$", :ILLEGAL],
	["x'abcdEF12$#'", :ILLEGAL],
	["x'abcdEF123'", :ILLEGAL],
	["x'", :ILLEGAL],
	["x'abcdEF12", :ILLEGAL],
	["X'abcdEF12$#'", :ILLEGAL],
	["X'abcdEF123'", :ILLEGAL],
	["X'", :ILLEGAL],
	["X'abcdEF12", :ILLEGAL],
].freeze

BASIC_TOKENS = [
	["-", :MINUS],
	["->", :PTR1],
	["->>", :PTR2],
	["(", :LP],
	[")", :RP],
	[";", :SEMI],
	["+", :PLUS],
	["*", :STAR],
	["%", :REM],
	[",", :COMMA],
	["&", :BITAND],
	["~", :BITNOT],
	["=", :EQ],
	["==", :EQ],
	[".", :DOT],
	["/", :SLASH],
	["<", :LT],
	["<=", :LE],
	["<>", :NE],
	["<<", :LSHIFT],
	[">", :GT],
	[">=", :GE],
	[">>", :RSHIFT],
	["!=", :NE],
	["|", :BITOR],
	["||", :CONCAT],
	["'abc'", :STRING],
	["'abc''def'", :STRING],
	["\xEF\x81", :ID],
	["\xEF\xFE\xFF", :ID],

	# ASCII control codes
	["\x00", :ILLEGAL],
	["\x01", :ILLEGAL],
	["\x02", :ILLEGAL],
	["\x03", :ILLEGAL],
	["\x04", :ILLEGAL],
	["\x05", :ILLEGAL],
	["\x06", :ILLEGAL],
	["\x07", :ILLEGAL],
	["\x08", :ILLEGAL],
	["\x0B", :ILLEGAL],
	["\x0E", :ILLEGAL],
	["\x0F", :ILLEGAL],
	["\x10", :ILLEGAL],
	["\x11", :ILLEGAL],
	["\x12", :ILLEGAL],
	["\x13", :ILLEGAL],
	["\x14", :ILLEGAL],
	["\x15", :ILLEGAL],
	["\x16", :ILLEGAL],
	["\x17", :ILLEGAL],
	["\x18", :ILLEGAL],
	["\x19", :ILLEGAL],
	["\x1A", :ILLEGAL],
	["\x1B", :ILLEGAL],
	["\x1C", :ILLEGAL],
	["\x1D", :ILLEGAL],
	["\x1E", :ILLEGAL],
	["\x1F", :ILLEGAL],

	# identifiers
	["a", :ID],
	["a1", :ID],
	['"abc"', :ID],
	['"abc""def"', :ID],
	["`abc`", :ID],
	["`abc``def`", :ID],
	["[abc]", :ID],
	["\x80", :ID],
	["\x80\x81\x82", :ID],
	["a$", :ID],
	["a_", :ID],
	["abc$", :ID],
	["abc_", :ID],

	# numerics
	["0", :INTEGER],
	["1", :INTEGER],
	["2", :INTEGER],
	["3", :INTEGER],
	["4", :INTEGER],
	["5", :INTEGER],
	["6", :INTEGER],
	["7", :INTEGER],
	["8", :INTEGER],
	["9", :INTEGER],
	["123", :INTEGER],
	["0xFF", :INTEGER],
	["0XFF", :INTEGER],
	["0x1234FF", :INTEGER],
	["0X1234FF", :INTEGER],
	["123.456", :FLOAT],
	[".456", :FLOAT],
	["123.", :FLOAT],
	["1e2", :FLOAT],
	["123e456", :FLOAT],
	["1e+2", :FLOAT],
	["123e+456", :FLOAT],
	["1e-2", :FLOAT],
	["123e-456", :FLOAT],
	["1E2", :FLOAT],
	["123E456", :FLOAT],
	["1E+2", :FLOAT],
	["123E+456", :FLOAT],
	["1E-2", :FLOAT],
	["123E-456", :FLOAT],
	["1$", :ILLEGAL],
	["1_000", :QNUMBER],
	["1_000.123", :QNUMBER],
	["123.1_000", :QNUMBER],
	["1_000E+2", :QNUMBER],
	["1E+2_000", :QNUMBER],
	["0X123_456", :QNUMBER],

	# variables
	["?", :VARIABLE],
	["?1", :VARIABLE],
	["?123", :VARIABLE],
	["$", :ILLEGAL],
	["$1", :VARIABLE],
	["$123", :VARIABLE],
	["$a", :VARIABLE],
	["$abc", :VARIABLE],
	["$foo::bar", :VARIABLE],
	["$foo::bar(baz)", :VARIABLE],
	["$foo::bar(baz", :ILLEGAL],
	["@", :ILLEGAL],
	["@1", :VARIABLE],
	["@123", :VARIABLE],
	["@a", :VARIABLE],
	["@abc", :VARIABLE],
	[":", :ILLEGAL],
	[":1", :VARIABLE],
	[":123", :VARIABLE],
	[":a", :VARIABLE],
	[":abc", :VARIABLE],
	["#", :ILLEGAL],
	["#1", :VARIABLE],
	["#123", :VARIABLE],
	["#a", :VARIABLE],
	["#abc", :VARIABLE],
	["x", :ID],
	["xyz", :ID],

	# blobs
	["x''", :BLOB],
	["x'abcdEF12'", :BLOB],
	["X''", :BLOB],
	["X'abcdEF12'", :BLOB],
].freeze

WEIRD_STRINGS = [
	["!-", [:ILLEGAL, :MINUS]],
	["$abc/", [:VARIABLE, :SLASH]],
	[".a", [:DOT, :ID]],
	["/1", [:SLASH, :INTEGER]],
	["0X123_456/", [:QNUMBER, :SLASH]],
	["0x1Fg", [:ILLEGAL]],
	["$a(b\0c)", [:ILLEGAL, :ILLEGAL, :ID, :RP]],
	["0x1F_g", [:ILLEGAL]],
	["1.0E+", [:ILLEGAL, :PLUS]],
	["1.0E+:", [:ILLEGAL, :PLUS, :ILLEGAL]],
	["1.0E-", [:ILLEGAL, :MINUS]],
	["1.0E-/", [:ILLEGAL, :MINUS, :SLASH]],
	["1.0E.10", [:ILLEGAL, :FLOAT]],
	[".1.1", [:FLOAT, :FLOAT]],
	["1.0F+5", [:ILLEGAL, :PLUS, :INTEGER]],
	["1.0d-10", [:ILLEGAL, :MINUS, :INTEGER]],
	["1.0e+", [:ILLEGAL, :PLUS]],
	["1.0e+/", [:ILLEGAL, :PLUS, :SLASH]],
	["1.0e,5", [:ILLEGAL, :COMMA, :INTEGER]],
	["1.0e-", [:ILLEGAL, :MINUS]],
	["1.0e-:", [:ILLEGAL, :MINUS, :ILLEGAL]],
	["1_000.123/", [:QNUMBER, :SLASH]],
	["1_000/", [:QNUMBER, :SLASH]],
	["1_000E+2/", [:QNUMBER, :SLASH]],
	["2 /* ", [:INTEGER, :SPACE, :SPACE]],
	["2 /*", [:INTEGER, :SPACE, :SLASH, :STAR]], # SQLite does not see a comment in a "/*" at the very end
	["2 /*x", [:INTEGER, :SPACE, :SPACE]],
].freeze

# From SQLite's test/literal.test - a "_" has to sit between two digits, but SQLite only checks
# that once the number is used as a value, its tokenizer takes them all
MISPLACED_DIGIT_SEPARATORS = %w[1_ 1234_ 12__34 1_.4 12._34 12.34_ 1.4_e4 1.4e4_ 1e_4 1_e5 1.0e1_______2 0x1_ 0xA__B].freeze
DIGIT_SEPARATORS = %w[1_000 1_000.5 .5_5 1e5_0 1_0.0_1e1_0 0x1_F 0xA_B_C].freeze

KEYWORDS = Plume::Lexer::KEYWORDS.to_a

# - - -

SPACE_TOKENS.each do |str, tk|
	test "tokenizes #{str.inspect} as #{tk.inspect}" do
		assert_token(str, tk)
	end
end

ILLEGAL_TOKENS.each do |str, tk|
	test "tokenizes #{str.inspect} as #{tk.inspect}" do
		assert_token(str, tk)
	end
end

BASIC_TOKENS.each do |str, tk|
	test "tokenizes #{str.inspect} as #{tk.inspect}" do
		assert_token(str, tk)
	end
end

KEYWORDS.each do |kw|
	test "tokenizes #{kw} as #{kw.inspect}" do
		assert_token(kw.to_s, kw)
	end
end

BASIC_TOKENS.product(KEYWORDS).each do |(str, tk), kw|
	input = "#{str} #{kw}"
	expected = [tk, :SPACE, kw]
	test "tokenizes #{input.inspect} as #{expected.inspect}" do
		actual = lex(input)
		assert expected == actual do
			"expected #{input.inspect} to tokenize as #{expected.inspect}, but was #{actual.inspect}"
		end
	end
end

WEIRD_STRINGS.each do |str, tks|
	test "tokenizes #{str.inspect} as #{tks}" do
		assert_equal tks, lex(str)
	end
end

MISPLACED_DIGIT_SEPARATORS.each do |str|
	test "select #{str} is a syntax error" do
		assert_raises(Plume::SyntaxError) { Plume.parse("select #{str}") }
	end
end

test "misplaced digit separators are fine in virtual table module arguments" do
	assert_equal lex("1_"), [:QNUMBER]
	assert_equal parse_stmt("create virtual table t using fts5(a 1_)").arguments, ["a 1_"]
end

DIGIT_SEPARATORS.each do |str|
	test "tokenizes #{str.inspect} as QNUMBER" do
		assert_equal [:QNUMBER], lex(str)
	end
end

# - - -

# tokens with values

test "tokenizes 2 /*  as INTEGER, SPACE, SPACE" do
	tokens = lex "2 /* ", with_values: true
	assert_equal [[:INTEGER, "2"], [:SPACE, " "], [:SPACE, "/* "]], tokens
end

# UTF16 strings

test "tokenizes UTF16 string as ID" do
	assert_token "\u{3042}".encode(Encoding::UTF_16), :ID
end

test "lexing leaves the caller's string alone" do
	sql = +"select 1"
	Plume.parse(sql)

	refute sql.frozen?
end

test "a NUL right after a keyword-looking word ends the identifier" do
	assert_equal [:ID, :ILLEGAL, :ID], lex("SE\0LECT")
	assert_raises(Plume::SyntaxError) { Plume.parse("SELECT j\0") }
end

test "a byte order mark is just space" do
	assert_equal Plume.parse("\xEF\xBB\xBFselect 1").first.to_sql, "SELECT 1"
end

test "a NUL ends a quoted string or name before its closing quote" do
	assert_raises(Plume::SyntaxError) { Plume.parse("select 'a\0b'") }
	assert_raises(Plume::SyntaxError) { Plume.parse("select [a\0b]") }
end

test "SQL whose bytes do not fit its encoding still lexes" do
	assert_equal Plume.parse("select a\xE2 from t".b.force_encoding(Encoding::US_ASCII)).first.body.columns[0].result.column, "a\xE2"
	assert_equal Plume.parse("select a\x8D from t".b.force_encoding(Encoding::Shift_JIS)).first.body.columns[0].result.column, "a�"
	assert_raises(Plume::SyntaxError) { Plume.parse("select 1".dup.force_encoding(Encoding::UTF_7)) }
end

test "select 2 /* is a syntax error, select 2 /* x is not" do
	assert_raises(Plume::SyntaxError) { Plume.parse("select 2 /*") }
	assert_equal parse_stmt("select 2 /* x").to_sql, "SELECT 2"
end

test "select .1.1 is two numbers, and so a syntax error" do
	assert_raises(Plume::SyntaxError) { Plume.parse("select .1.1") }
end
