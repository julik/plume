# frozen_string_literal: true

require_relative "../support/fuzz"
require_relative "../support/ast_shape"

# Whatever we are handed, the lexer and the parser either succeed or raise Plume::SyntaxError -
# never a NoMethodError, an encoding error or a SystemStackError, and never hang. Whatever
# parses also has to print back to SQL that parses into the same tree, and survive analysis
random = Fuzz.random("garbage")
statements = Fuzz.fixture_statements(random, 200)

GARBAGE_CASES = Array.new(Fuzz.iterations(6000)) do |i|
	case i % 6
	when 0 then Fuzz.random_bytes(random)
	when 1 then Fuzz.random_utf8(random)
	when 2 then Fuzz.mutate_bytes(statements.sample(random:), random).force_encoding(Encoding::UTF_8)
	when 3 then Fuzz.mutate_bytes(statements.sample(random:), random)
	when 4 then Fuzz.mutate_tokens(statements.sample(random:), random)
	else Fuzz.reencode(Fuzz.mutate_tokens(statements.sample(random:), random), random)
	end
end.freeze

ANALYZABLE = Plume::Analysis::Resolver::STATEMENTS

GARBAGE_CASES.each_with_index do |sql, i|
	test "garbage #{i}: #{Fuzz.describe(sql)}" do
		error = Fuzz.exception_from { Plume.tokenize(sql) }
		assert(error.nil? || Plume::SyntaxError === error) { "tokenizing raised #{error.inspect}, #{Fuzz.replay}" }

		parsed = nil
		error = Fuzz.exception_from { parsed = Plume.parse(sql) }
		assert(error.nil? || Plume::SyntaxError === error) do
			"parsing raised #{error.inspect}\n#{error.backtrace&.first(5)&.join("\n")}\n#{Fuzz.replay}"
		end
		next unless parsed

		printed = reparsed = nil
		error = Fuzz.exception_from { reparsed = Plume.parse(printed = parsed.map(&:to_sql).join(";\n")) }
		assert(error.nil?) { "printing or parsing the printed SQL raised #{error.inspect}\n#{printed.inspect}\n#{Fuzz.replay}" }
		next unless reparsed

		assert_equal AstShape.of(reparsed), AstShape.of(parsed)

		parsed.grep(ANALYZABLE).each do |statement|
			error = Fuzz.exception_from { Plume.access(statement, strict: false) }
			assert(error.nil? || Plume::Analysis::Error === error) do
				"analysis raised #{error.inspect}\n#{error.backtrace&.first(5)&.join("\n")}\n#{Fuzz.replay}"
			end
		end
	end
end
