# frozen_string_literal: true

if ENV["COVERAGE"] == "true"
	require "simplecov"

	SimpleCov.start do
		command_name "quickdraw"
		enable_coverage_for_eval
		enable_for_subprocesses true
		enable_coverage :branch
		primary_coverage :branch
		add_filter %r{^/fixtures/}
		add_group "Core", ["lib/plume/parser.rb", "lib/plume/lexer.rb"]
		add_group "AST", "lib/plume/ast"
	end
end

require "plume"
require_relative "../test/support/ast_shape"

class Quickdraw::Test
	def lex(str, with_values: false)
		lex = Plume::Lexer.new(str)
		tokens = []
		while (token = lex.next_token)
			tokens << (with_values ? [token, lex.value] : token)
		end
		tokens
	end

	# Printing a parse and parsing that again must give the same tree
	def round_trip(sql)
		original = Plume.parse(sql)
		printed = original.map(&:to_sql).join(";\n")
		assert_equal AstShape.of(Plume.parse(printed)), AstShape.of(original)
		printed
	end

	def sorted(hash) = hash.transform_values { |set| set.to_a.sort }

	def parse_stmt(sql)
		Plume::Parser.new(sql).parse.first
	end

	def assert_statement(sql, structure)
		parsed = parse_stmt(sql)
		assert_equal parsed, structure
	end

	def assert_token(str, tk)
		lex = Plume::Lexer.new(str)

		token = lex.next_token
		assert(tk == token) do
			"expected #{tk.inspect} to == #{token.inspect}"
		end

		final = lex.next_token
		assert(final == nil) do
			"expected #{final.inspect} to be nil"
		end
	end
end
