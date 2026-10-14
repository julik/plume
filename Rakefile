# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks"
require "rubocop/rake_task"

# Anything after the task name goes to quickdraw, like `rake test -p 4 test/select.test.rb`
desc "Run the quickdraw test suite"
task :test do
	require "quickdraw"

	args = Array(ARGV[1..])
	args = ["-t", "1", "./test/**/*.test.rb"] if args.empty?
	Quickdraw::CLI.new(args).call
end

RuboCop::RakeTask.new

task default: %i[test rubocop]
