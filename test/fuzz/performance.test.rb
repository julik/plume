# frozen_string_literal: true

# Inputs shaped to find superlinear corners: long runs of one token, deep nesting, long names,
# strings and lists. Every step - lexing, parsing, printing and analysis - has to take roughly
# eight times as long for an input eight times the size. The bound is loose, since other tests
# run alongside, but the quadratic cases this has caught took 30 to 60 times as long
module PerformanceShapes
	extend self

	SHAPES = {
		"parentheses" => ->(n) { "select #{"(" * n}1#{")" * n}" },
		"unclosed parentheses" => ->(n) { "select #{"(" * (n * 10)}1" },
		"parenthesized joins" => ->(n) { "select 1 from #{"(" * n}t#{")" * n}" },
		"unary minus" => ->(n) { "select #{"- " * n}1" },
		"case nesting" => ->(n) { "select #{"case when 1 then " * (n / 4)}1#{" end" * (n / 4)}" },
		"case chain" => ->(n) { "select case #{"when a then 1 " * n}end from t" },
		"and chain" => ->(n) { "select a from t where #{(["a = 1"] * n).join(" and ")}" },
		"concat chain" => ->(n) { "select #{(["'x'"] * n).join(" || ")}" },
		"in list" => ->(n) { "select a from t where a in (#{(1..n * 10).to_a.join(", ")})" },
		"values rows" => ->(n) { "insert into t (a, b) values #{(["(1, 'a')"] * (n * 2)).join(", ")}" },
		"columns" => ->(n) { "select #{(1..n * 4).map { |i| "a AS c#{i}" }.join(", ")} from t" },
		"comma joins" => ->(n) { "select 1 from #{(0..n).map { |i| "t AS t#{i}" }.join(", ")}" },
		"joins" => ->(n) { "select 1 from t as t0 #{(1..n).map { |i| "join t as t#{i}" }.join(" ")}" },
		"joins on" => ->(n) { "select 1 from t as t0 #{(1..n).map { |i| "join t as t#{i} on t#{i}.a = t#{i - 1}.a" }.join(" ")}" },
		"ctes" => ->(n) { "with #{(1..n / 2).map { |i| "c#{i} as (select #{i == 1 ? "a from t" : "* from c#{i - 1}"})" }.join(", ")} select * from c#{n / 2}" },
		"union" => ->(n) { (["select a from t"] * (n / 2)).join(" union all ") },
		"statements" => ->(n) { "select a from t;" * (n * 2) },
		"semicolons" => ->(n) { ";" * (n * 100) },
		"spaces" => ->(n) { "select#{" " * (n * 400)}1" },
		"comment" => ->(n) { "select 1 /* #{"*" * (n * 200)} */" },
		"long name" => ->(n) { "select #{"a" * (n * 200)} from t" },
		"long quoted name" => ->(n) { %(select "#{'a""' * (n * 60)}" from t) },
		"long string" => ->(n) { "select '#{"a''" * (n * 60)}'" },
		"long blob" => ->(n) { "select x'#{"ab" * (n * 100)}'" },
		"near-miss keywords" => ->(n) { "select #{(["a not null"] * n).join(" and ")} from t" },
		"syntax error at the end" => ->(n) { "select #{(1..n * 4).map { |i| "c#{i}" }.join(", ")} from t where" },
	}.freeze

	CATALOG = Plume::Catalog.from_sql("CREATE TABLE t (a, b, c)")

	# Each qualified name is looked up among all the tables joined so far, so n joins take n² - but
	# SQLite refuses more than 64 tables in a join, where that is still a few milliseconds
	KNOWN = [["analysis", "joins on"]].freeze

	def seconds
		Array.new(3) do
			started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
			yield
			Process.clock_gettime(Process::CLOCK_MONOTONIC) - started
		end.min
	end

	def parsed(sql)
		Plume.parse(sql)
	rescue Plume::SyntaxError
		[]
	end

	STEPS = {
		"lexing" => ->(sql, _) { Plume.tokenize(sql) },
		"parsing" => ->(sql, _) { parsed(sql) },
		"printing" => ->(_, statements) { statements.each(&:to_sql) },
		"analysis" => ->(_, statements) { statements.grep(Plume::Analysis::Resolver::STATEMENTS).each { |s| Plume.access(s, catalog: CATALOG, strict: false) } },
	}.freeze
end

PerformanceShapes::SHAPES.each do |shape, sql|
	small, large = sql.(50), sql.(400)
	PerformanceShapes::STEPS.each do |step, run|
		next if PerformanceShapes::KNOWN.include?([step, shape])

		test "#{step} #{shape} takes time in proportion to its size" do
			small_statements = PerformanceShapes.parsed(small)
			large_statements = PerformanceShapes.parsed(large)
			fast = PerformanceShapes.seconds { run.(small, small_statements) }
			slow = PerformanceShapes.seconds { run.(large, large_statements) }

			# Too quick to measure either way
			next assert(true) if slow < 0.005

			assert(slow / fast < 24) { "8 times the input took #{(slow / fast).round(1)} times as long (#{fast.round(4)}s and #{slow.round(4)}s)" }
		end
	end
end
