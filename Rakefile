# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"

desc "Run the quickdraw test suite"
task :test do
	sh "bundle exec qt -t 1 './test/**/*.test.rb'"
end

RuboCop::RakeTask.new

task default: %i[test rubocop]
