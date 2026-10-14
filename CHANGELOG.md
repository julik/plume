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
- `literal` is now declared as a runtime dependency
- `Plume.eager_load!` makes Plume usable from Ractors: parsing, printing and analysis run in any Ractor, and catalogs and parsed trees can be made shareable

## [0.1.0] - 2024-03-22

- Initial release
