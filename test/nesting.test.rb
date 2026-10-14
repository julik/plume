# frozen_string_literal: true

DEEP_SHAPES = {
	"parentheses" => ->(n) { "select #{"(" * n}1#{")" * n}" },
	"unary minus" => ->(n) { "select #{"- " * n}1" },
	"subqueries" => ->(n) { "select #{"(select " * n}1#{")" * n}" },
	"case" => ->(n) { "select #{"case when 1 then " * n}1#{" end" * n}" },
	"function calls" => ->(n) { "select #{"abs(" * n}1#{")" * n}" },
	"ctes" => ->(n) { "#{"with c as (" * n}select 1#{") select * from c" * n}" },
	"joins in parentheses" => ->(n) { "select 1 from #{"(" * n}t#{")" * n}" },
	"and chain" => ->(n) { "select #{(["a = 1"] * n).join(" and ")}" },
	"compound select" => ->(n) { (["select 1"] * n).join(" union all ") },
}.freeze

DEEP_SHAPES.each do |name, shape|
	test "#{name} nested past the limit raise NestingTooDeep" do
		assert_raises(Plume::NestingTooDeep) { Plume.parse(shape.(Plume::Parser::MAX_DEPTH + 1)) }
	end

	test "#{name} nested a hundred thousand times give up right away" do
		started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
		assert_raises(Plume::NestingTooDeep) { Plume.parse(shape.(100_000)) }

		assert Process.clock_gettime(Process::CLOCK_MONOTONIC) - started < 5 # was minutes, or a SystemStackError
	end

	test "#{name} nested a hundred levels parse, print and get analyzed" do
		statement = Plume.parse(shape.(100)).first

		assert_equal Plume.parse(statement.to_sql).size, 1
		Plume.access(statement, strict: false) if Plume::SelectStatement === statement
	end
end

test "running out of stack in a fiber is NestingTooDeep too" do
	# Fibers get a 128 KB VM stack, far less than the nesting limit needs
	error = Fiber.new do
		Plume.parse(DEEP_SHAPES["function calls"].(300))
	rescue Exception => e # rubocop:disable Lint/RescueException
		e
	end.resume

	assert_operator Plume::NestingTooDeep, :===, error
end
