# frozen_string_literal: true

# Prism, Regexp.linear_time? and Regexp.timeout all need Ruby 3.3
if RUBY_VERSION >= "3.3"
	require "prism"

	# Every regexp literal in lib/ has to run in linear time, which on Ruby 3.2+ means one the
	# matcher can memoize - no backreferences, no lookarounds that defeat it. Ruby 3.1, which we
	# still support, has no memoization at all, so on top of that the ones that run on SQL get
	# adversarial input and a timeout
	REGEXP_LITERALS = Dir[File.expand_path("../../lib/**/*.rb", __dir__)].sort.flat_map do |path|
		found = []
		visit = ->(node) do
			found << [path, node.location.start_line, node.unescaped, node.options] if node.is_a?(Prism::RegularExpressionNode)
			node.compact_child_nodes.each(&visit)
		end
		visit.(Prism.parse_file(path).value)
		found
	end

	REGEXP_LITERALS.each do |path, line, source, options|
		test "the regexp at #{File.basename(path)}:#{line} runs in linear time" do
			flags = (options & Prism::RegularExpressionFlags::IGNORE_CASE).zero? ? 0 : Regexp::IGNORECASE
			assert Regexp.linear_time?(Regexp.new(source, flags))
		end
	end

	ADVERSARIAL_NAMES = [
		"a" * 200_000 + "-",
		"_" * 200_000 + "\n",
		"9" * 200_000,
		"aB" * 100_000 + " ",
		"a" * 100_000 + "\xFF".b.force_encoding(Encoding::UTF_8) + "a" * 100_000,
	].freeze

	test "quoting names that almost qualify to go bare is linear" do
		printer = Plume::Printer.new
		Regexp.timeout = 2 # seconds, a backtracking blowup takes far longer on these
		ADVERSARIAL_NAMES.each { |name| assert printer.identifier(name).start_with?('"') }
	ensure
		Regexp.timeout = nil
	end
end
