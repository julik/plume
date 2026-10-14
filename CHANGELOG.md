## [Unreleased]

- Parse every statement in SQLite's grammar: SELECT (with CTEs, compounds, joins, window definitions and subqueries), INSERT/REPLACE with upserts, UPDATE … FROM, DELETE, RETURNING, CREATE TABLE/VIEW/INDEX/TRIGGER/VIRTUAL TABLE, ALTER TABLE, DROP, transactions and savepoints, PRAGMA, ATTACH/DETACH, ANALYZE, REINDEX, VACUUM and EXPLAIN [QUERY PLAN]
- `Plume.reads` and `Plume.access`: which tables and columns a statement reads and writes, looking through aliases, joins, subqueries, CTEs and views, checked against SQLite's authorizer callback
- `Plume.reads` and `Plume.access` also take an already parsed statement
- `Plume::Catalog`, built from schema SQL or from a live database
- `Node#to_sql` prints any tree, parsed or built by hand, back to SQL
- `Node#children`, `#walk`, `#each_node`, `#location`, `#source_text` and pattern matching with `deconstruct_keys`
- Bind parameters parse as `Plume::Variable`
- Syntax errors point at the offending line
- Fixed: `a IN (…) AND b` and friends stopped after the IN/BETWEEN/LIKE/GLOB; quotes doubled inside strings and identifiers were not unescaped; a column type following a REFERENCES clause came out empty
- Building a tree is no longer quadratic in its size
- SQL nested deeper than SQLite's limit of 1000 levels, or deeper than the stack at hand allows, raises `Plume::NestingTooDeep` (a `Plume::SyntaxError`) from parsing, `to_sql` and `Plume.reads`/`Plume.access` instead of `SystemStackError`
- Fixed, found by fuzzing against SQLite: crashes (NoMethodError, ArgumentError, encoding errors) on a NUL right after a word, on SQL that is not valid UTF-8 or does not fit its encoding, and on names, collations and column types that are not valid UTF-8
- Fixed: SQL that SQLite rejects no longer parses - list items without commas between them and dangling commas, `SELECT 1 SELECT 2`, `a ~ b`, `NULLS` followed by anything but FIRST or LAST, misplaced digit separators like `1_` and `12__34`, `0x1Fg`, a NUL inside quotes, `/*` at the very end, `DROP TABLE if`, `DEFAULT -x` and illegal tokens in virtual table arguments
- Fixed: SQL that SQLite accepts now parses - `;;`, FILTER, OVER, WINDOW, TRUE, FALSE and CURRENT_TIME/DATE/TIMESTAMP as names, `CAST(x AS )`, a comma before the first table option, and a UTF-8 byte order mark
- Fixed: hex literals had the value 0, `1e5_0` came out as an Integer, and a sign followed by a space (`PRAGMA cache_size = - 2000`) made the value 0
- Fixed: names are compared like SQLite does, folding only ASCII letters, so `"É"` and `"é"` are two tables and `COLLATE nöcase` prints unchanged
- Fixed: keywords used as names are always quoted when printed, `DROP TABLE "if"` rather than `DROP TABLE if`
- Fixed: `Catalog.from_sqlite` knows a table is WITHOUT ROWID when other table options or a comment follow
- Parsing deeply parenthesized expressions and printing long chains of joins are linear rather than quadratic
- `literal` is now declared as a runtime dependency

## [0.1.0] - 2024-03-22

- Initial release
