# Plan: SELECT + CTE ASTs and "what does this query read"

Date: 2026-10-14
Branch: `julik/select-cte-reads`

## Objective

1. Parse every SQLite `SELECT` (including CTEs, compounds, joins, subqueries) into the
   concrete-token AST introduced in the March 2025 rework (`Node.concrete`, token spans + `full_source`).
2. Ship a layer on top of the AST that answers "which tables and which columns does this
   statement read", suitable for ACL checks. This is the first bona-fide use case of the library.
3. Extend to DML (`INSERT`/`UPDATE`/`DELETE`) so the same layer reports writes.
4. Round-trip AST → SQL so the AST becomes usable for rewriting.

## Progress

Phases 1-5 are done on this branch (see `git log`): every statement parses, the corpus
round-trips through `to_sql`, and `Plume.reads` / `Plume.access` are checked against SQLite's
authorizer. FTS5 tests added on request (module arguments, MATCH queries, executed round trips).

## Starting point (as of `c3b899ba`, 2025-03-28)

- Green on Ruby 3.4.8: `expression` (553), `create_table` (585), `tokens` (21789), `select` (2), `node` (1).
- `select_core` handles only `SELECT [DISTINCT|ALL] cols FROM single_table`. Aliases, `WHERE`, joins,
  comma joins, subqueries, `ORDER BY`/`LIMIT`, compounds, `GROUP BY`/`HAVING`, `VALUES` all fail.
- `from_source` bugs: references `next_precedence` (only a local in `expression`) → `NameError` on
  table-valued functions; `schema.func(...)` branch calls `name` twice and eats a token.
- `IN (select)`, `EXISTS (select)`, scalar subqueries are commented out in `expression`/`basic_expression`.
- Unimplemented statements are aliased to `_consume_all`, which swallows tokens and returns a Symbol.
  `test/fixtures.test.rb` therefore counts them as passes. Real SELECT fixture pass rate: 793 / 11287.
- Legacy `prop`-style nodes still exist: join operators, `JoinOnConstraint`, `JoinUsingConstraint`,
  `LikeExpression`, `Variable`, `SignedExpression`, `TernaryExpression`, `FunctionArguments`, `LiteralExpression`.
- `plume.gemspec` does not declare `literal` as a runtime dependency. `quickdraw` and `literal` come from git HEAD.
- `lib/plume/generator.rb` is a Hash → SQL builder unrelated to the AST.
- `sqlite3` gem (2.9.x) exposes `Database#authorizer=`, usable as a test oracle for read analysis.

## Conventions for all steps

- Tests use quickdraw (`bundle exec qt -t 1 "./test/**/*.test.rb"`), test names are the SQL string
  being parsed, as in `test/expression.test.rb`.
- New nodes use the concrete-token style: `token :foo_kw`, `attr`, `node`/`nodes`, `self.new` and
  `self.concrete` signatures, value readers falling back to `*_val`. Each parser method keeps the
  `parse.y` rules + syntax diagram header comment block.
- Every step ends with: unit tests green, fixture report not regressed (see step 1.2), one or more commits.

---

## Phase 1 — Ground truth

### 1.1 Packaging and toolchain
- Add `spec.add_dependency "literal"` to `plume.gemspec`; pin `literal` and `quickdraw` git deps to
  specific `ref:`s in `Gemfile`.
- Rakefile: replace `Minitest::TestTask` with a `test` task that shells out to `qt`.
- Decide on `.ruby-version` (3.2.5 is not commonly installed; CI min is 3.1). Make CI and local agree.
- Done: `bundle exec rake test` runs quickdraw, CI green.

### 1.2 Honest fixture harness
- Replace the `_consume_all` aliases with a method that raises `Plume::NotImplementedError` naming the statement kind.
- `test/fixtures.test.rb`: classify each fixture as pass / fail / not-implemented. Not-implemented is not a pass.
- Add `bin/fixture-report` printing pass/fail counts per leading statement keyword, and commit its output as
  `llm/fixture-report.txt` so every later step can diff against it.
- Done: report shows real numbers (SELECT ~7%, INSERT/UPDATE/DELETE 0% implemented).

### 1.3 Traversal API on `Node`
- `Node#children` (ordered, derived from `node`/`nodes` props), `Node#each_node` / `Node#walk` (depth-first,
  yields node + parent), `Node#deconstruct_keys` for pattern matching.
- `node`/`nodes` declarations record which props hold child nodes so traversal needs no per-class code.
- Done: tests walking a parsed `CREATE TABLE` and a nested expression, visiting every node exactly once.

## Phase 2 — SELECT grammar

### 2.1 Select core clauses
- Fix result-column aliases (`expr AS name`, `expr name`, string aliases).
- `WHERE`, `GROUP BY`, `HAVING`, `WINDOW name AS (window-defn)` (reuse `over_clause` / `frame_spec` pieces).
- `VALUES (…), (…)` as a select core (`ValuesClause` node).
- Done: unit tests for every clause in isolation and combined.

### 2.2 FROM: table-or-subquery
- `TableName` with schema, alias (`AS` optional), `INDEXED BY name` / `NOT INDEXED`.
- Table-valued functions with and without schema (fix the two `from_source` bugs) → `TableFunction` node with alias.
- `( select-stmt ) [AS] alias` → `SubquerySource` node.
- `( table-or-subquery | join-clause )` parenthesized sources.
- Done: tests for each source form.

### 2.3 FROM: joins
- Port join operators to concrete style. Model: one `JoinOperator` node with `natural`, `kind`
  (`:INNER, :LEFT, :RIGHT, :FULL, :CROSS, :COMMA`), `outer` — or keep the per-kind classes but convert them;
  pick one and remove the other.
- `JoinOnConstraint`, `JoinUsingConstraint` converted.
- `JoinClause` node: left source + list of `[operator, source, constraint]`.
- Comma joins produce the same structure.
- Done: tests for every operator spelling in `parse.y` `joinop`, including `NATURAL LEFT OUTER JOIN`.

### 2.4 Statement-level: ORDER BY, LIMIT, compounds
- `select_stmt` wraps one or more cores joined by `UNION | UNION ALL | INTERSECT | EXCEPT`
  (convert compound operator nodes). `ORDER BY` and `LIMIT/OFFSET` (including `LIMIT a, b`, where `b`
  is the limit and `a` the offset) attach to the statement, not the last core.
- Node shape: `SelectStatement` (with, compound list, order_by, limit, offset) containing `SelectCore`s.
  Rename the current WIP `SelectStatement` fields accordingly.
- Done: tests for compounds with trailing ORDER BY / LIMIT.

### 2.5 WITH / CTEs
- `WITH [RECURSIVE] name [(col, …)] AS [[NOT] MATERIALIZED] (select-stmt), …` → `WithClause` + `CommonTableExpression`.
- Wire `WITH` in `sql_stmt` to `select_stmt` (later also DML).
- Done: tests for plain, recursive, column-listed and materialized CTEs.

### 2.6 Subqueries inside expressions
- `expr [NOT] IN (select-stmt)`, `expr [NOT] IN schema.table`, `expr [NOT] IN table_function(…)`.
- `[NOT] EXISTS (select-stmt)`, scalar `(select-stmt)`.
- Done: tests, plus the existing expression suite stays green.

### 2.7 Remaining legacy nodes
- Convert every remaining `prop`-style node to concrete style; delete dead ones.
- Done: `grep -l "prop " lib/plume/ast` only matches `node.rb`.

### 2.8 Fixture sweep for SELECT
- Run the fixture report, bucket SELECT/WITH failures by error, fix grammar gaps.
- Fixtures that are intentionally invalid SQL (from SQLite's error tests) go into an explicit allowlist with a reason.
- Done: every SELECT/WITH fixture either parses or is on the allowlist.

## Phase 3 — Read analysis

### 3.1 Catalog
- `Plume::Catalog`: tables → ordered columns (+ `WITHOUT ROWID` flag), views → parsed select.
- Builders: `Catalog.from_sql(schema_sql)` using our own `CREATE TABLE` (and later `CREATE VIEW`) parser;
  `Catalog.from_sqlite(db)` via `sqlite_schema` / `PRAGMA table_xinfo`.
- Done: catalog built from `fixtures/schemas/rubyvideo`.

### 3.2 Scope resolution
- `Plume::Analysis::Scope`: sources visible at a point (alias → table / CTE / subquery / table function),
  parent scope for correlated subqueries.
- Rules: CTE names shadow tables; derived tables expose their result-column names; `USING`/`NATURAL`
  merge columns; `ORDER BY` may reference result-column aliases; `rowid`/`oid`/`_rowid_` resolve to
  the table unless shadowed by a real column; recursive CTE references itself.
- Done: unit tests on scope construction for each rule.

### 3.3 Reads API
- `Plume.reads(sql, catalog:)` → `Plume::Analysis::Reads` with
  - `tables` — base tables touched (CTE/subquery names resolved to the underlying tables),
  - `columns` — `{ table => Set[column] }`, each column tagged `:projected` and/or `:referenced`
    (WHERE / JOIN / GROUP BY / HAVING / ORDER BY / window / function args),
  - `unresolved` — references that could not be attributed, each with source location.
- `*` and `t.*` expand via catalog; without a catalog they are reported as `unresolved`.
- Strict by default: unresolved references, multiple statements, or a non-SELECT statement raise
  `Plume::Analysis::Error`. `strict: false` returns the partial result.
- Views: expanded through the catalog when present (reads attributed to base tables), otherwise reported as the view.
- Done: hand-written tests for each scoping rule above.

### 3.4 Authorizer oracle
- Test helper: load a catalog's DDL into an in-memory `SQLite3::Database`, set `db.authorizer`,
  `prepare` the statement, collect `SQLITE_READ` (table, column) events.
- Differential test over every SELECT fixture that prepares against a known schema, plus a generated
  corpus over the rubyvideo schema. Plume's `tables`/`columns` must equal the authorizer's set.
- Known semantic differences (e.g. authorizer reporting `""` column for `count(*)`) documented in the helper.
- Done: differential suite green; disagreements fixed or documented.

### 3.5 Showcase
- `examples/read_guard.rb`: policy `{ "users" => %w[id name] }`, rejects any query whose reads escape the policy,
  error message points at the offending token with a caret.
- README section "What does this query read?" + honest note: with a live connection, SQLite's authorizer
  is the runtime enforcement point; Plume does it statically (no DB, before execution, with locations).
- Done: example runs, README updated, roadmap checklist updated.

## Phase 4 — DML and remaining statements

### 4.1 INSERT / REPLACE
- Full grammar incl. `WITH`, `INSERT OR …`, column list, `VALUES` / `SELECT` / `DEFAULT VALUES`,
  upsert (`ON CONFLICT … DO UPDATE/NOTHING`), `RETURNING`.

### 4.2 UPDATE
- `WITH`, `OR …`, qualified table with alias / `INDEXED BY`, `SET` (incl. `(a, b) = (…)`), `FROM`, `WHERE`,
  `RETURNING`, `ORDER BY`/`LIMIT`.

### 4.3 DELETE
- `WITH`, qualified table, `WHERE`, `RETURNING`, `ORDER BY`/`LIMIT`.

### 4.4 Writes in the analysis layer
- `Plume.access(sql, catalog:)` returning reads and writes (`{ table => Set[column] }` for INSERT/UPDATE,
  table-level for DELETE). Reads include WHERE/SET-expression/RETURNING columns.
- Extend the authorizer oracle to `SQLITE_INSERT` / `SQLITE_UPDATE` / `SQLITE_DELETE`.

### 4.5 CREATE VIEW / INDEX / TRIGGER, then the rest
- `CREATE VIEW` first (feeds the catalog's view expansion), then `CREATE INDEX`, `CREATE TRIGGER`,
  `CREATE VIRTUAL TABLE`, `DROP *`, `ALTER TABLE`, transaction statements, `PRAGMA`, `ATTACH`/`DETACH`,
  `ANALYZE`, `REINDEX`, `VACUUM`, `SAVEPOINT`/`RELEASE`.
- Keep `EXPLAIN [QUERY PLAN]` on the statement node instead of discarding it.
- Done: `_consume_all` deleted; fixture report shows no not-implemented rows.

## Phase 5 — Round-trip

### 5.1 AST → SQL
- `Node#to_sql`: for concrete nodes, reproduce source from token spans; for abstract (`.new`) nodes,
  emit canonical SQL.
- Round-trip test over the fixture corpus: parse → `to_sql` → parse yields an equal AST.
- Retire `lib/plume/generator.rb` (or reimplement it on top of AST nodes) — decide when 5.1 lands.

## Phase 7 — Embedded grammars

SQLite carries several languages inside string literals and module arguments. Plume keeps them
as opaque strings today, and the FTS5 tests prove they come through a round trip byte for byte.
Giving them their own small parsers, attached to the literal where context says which language
it is, would let tools look inside:

- FTS5 query syntax in `MATCH` / `=` / table-valued arguments of an fts5 table: phrases, `NEAR()`,
  `{col1 col2}:` column filters, `^` initial-token, `*` prefix, `AND/OR/NOT`. Column filters name
  columns - reads analysis could report them.
- FTS5 / FTS3 / R*Tree module arguments (`tokenize = '…'` with quotes in quotes, `content=`,
  `prefix=`), and the special-command INSERTs (`INSERT INTO fts(fts, rank) VALUES ('rank', 'bm25(…)')`).
- JSON paths (`'$.a[0].b'`, `'$[#-1]'`) in json_extract / -> / ->> / json_each.
- Date and time modifiers and strftime formats (`'+1 day'`, `'start of month'`, `'%Y-%m'`).
- printf/format strings, LIKE/GLOB patterns with ESCAPE.

Context matters: the same `'…'` is a query only on the right of MATCH against an fts5 table, so
these hook in after name resolution, not in the parser.

## Phase 6 — Release

- Syntax error messages with multi-line caret highlighting (TODO in `Parser#error!`).
- Benchmark lexer + parser on the fixture corpus; record numbers in README.
- Fix README (`Plume.parse` returns an array of statements, real coverage badge or none), CHANGELOG, version bump, release.
