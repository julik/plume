# frozen_string_literal: true

# A read-only SQL console that only lets people see some of the columns.
#
#   bundle exec ruby examples/read_guard.rb
#
# The check happens before the query ever reaches the database. With a live connection,
# SQLite's own authorizer callback is the place to enforce a policy at runtime - this is
# for when you want to vet SQL ahead of time, without a database, or with good error messages.

require "plume"

class ReadGuard
	Denied = Class.new(StandardError)

	# `allowed` maps table names to the columns that may be read, or to :all. Table-valued
	# functions are denied unless listed - some, like dbstat or sqlite_dbpage, read raw pages
	def initialize(catalog:, allowed:, functions: %w[json_each json_tree])
		@catalog = catalog
		@allowed = allowed
		@functions = functions
	end

	def check!(sql)
		reads = Plume.reads(sql, catalog: @catalog)
		denied_functions = reads.functions.to_a - @functions
		raise Denied, "not allowed to call #{denied_functions.join(", ")}" if denied_functions.any?

		reads.references.each do |ref|
			columns = @allowed[ref.table_key]
			next if columns == :all
			next if columns && (ref.column.nil? || columns.include?(ref.column))

			what = ref.column ? "#{ref.table_key}.#{ref.column}" : ref.table_key
			raise Denied, "not allowed to read #{what}\n#{Plume::Analysis.excerpt(ref.node)}"
		end
		reads
	end
end

if $PROGRAM_NAME == __FILE__
	catalog = Plume::Catalog.from_sql(<<~SQL)
		CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password_digest TEXT);
		CREATE TABLE posts (id INTEGER PRIMARY KEY, user_id INT, title TEXT, body TEXT);
		CREATE VIEW authors AS SELECT u.id, u.name, u.email FROM users u WHERE EXISTS (SELECT 1 FROM posts p WHERE p.user_id = u.id);
	SQL

	guard = ReadGuard.new(catalog:, allowed: { "users" => %w[id name], "posts" => :all })

	[
		"SELECT p.title, u.name FROM posts p JOIN users u ON u.id = p.user_id ORDER BY p.id DESC LIMIT 10",
		"SELECT count(*) FROM users",
		"SELECT * FROM users",
		"SELECT title FROM posts WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@example.com')",
		"WITH recent AS (SELECT * FROM posts ORDER BY id DESC LIMIT 5) SELECT title FROM recent",
		"SELECT name FROM authors",
		"SELECT value FROM posts, json_each(posts.title)",
		"SELECT * FROM sqlite_dbpage",
		"SELECT * FROM dbstat('main')",
	].each do |sql|
		guard.check!(sql)
		puts "ok      #{sql}"
	# Anything the analysis cannot account for is refused as well
	rescue ReadGuard::Denied, Plume::Analysis::Error => e
		puts "denied  #{sql}\n        #{e.message.gsub("\n", "\n        ")}"
	end
end
