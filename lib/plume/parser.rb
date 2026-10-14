# frozen_string_literal: true

module Plume
	class Parser
		# https://www.sqlite.org/syntaxdiagrams.html
		class ErrorMessage
			attr_reader :msg

			def initialize(msg)
				@msg = msg
			end
		end

		# see: https://github.com/sqlite/sqlite/blob/master/src/parse.y#L255-L283
		TOKEN_FALLBACKS = Set[
			:EXPLAIN,
			:QUERY,
			:PLAN,
			:BEGIN,
			:DEFERRED,
			:IMMEDIATE,
			:EXCLUSIVE,
			:END,
			:ROLLBACK,
			:SAVEPOINT,
			:RELEASE,
			:IF,
			:TEMP,
			:TEMPORARY,
			:WITHOUT,
			:ABORT,
			:ACTION,
			:AFTER,
			:ANALYZE,
			:ASC,
			:ATTACH,
			:BEFORE,
			:BY,
			:CASCADE,
			:CAST,
			:CONFLICT,
			:DATABASE,
			:DESC,
			:DETACH,
			:EACH,
			:FAIL,
			:MATCH,
			:REGEXP,
			:GLOB,
			:LIKE,
			:ROWID,
			:STRICT,
			:COLUMN,
			:DO,
			:FOR,
			:IGNORE,
			:INITIALLY,
			:INSTEAD,
			:NO,
			:KEY,
			:OF,
			:OFFSET,
			:PRAGMA,
			:RAISE,
			:RECURSIVE,
			:REPLACE,
			:RESTRICT,
			:ROW,
			:ROWS,
			:TRIGGER,
			:VACUUM,
			:VIEW,
			:VIRTUAL,
			:WITH,
			:NULLS,
			:FIRST,
			:LAST,
			:CURRENT,
			:FOLLOWING,
			:PARTITION,
			:PRECEDING,
			:RANGE,
			:UNBOUNDED,
			:EXCLUDE,
			:GROUPS,
			:OTHERS,
			:TIES,
			:GENERATED,
			:ALWAYS,
			:MATERIALIZED,
			:REINDEX,
			:RENAME,
			:CTIME_KW,
		].freeze

		OPERATOR_PRECEDENCE = {
			BITNOT:  100,
			UPLUS:   100,
			UMINUS:  100,
			COLLATE:  90,
			CONCAT:   80,
			PTR1:     80,
			PTR2:     80,
			STAR:     70,
			SLASH:    70,
			REM:      70,
			PLUS:     60,
			MINUS:    60,
			BITAND:   55,
			BITOR:    55,
			LSHIFT:   55,
			RSHIFT:   55,
			NOT:      50,
			LT:       40,
			GT:       40,
			LE:       40,
			GE:       40,
			EQ:       30,
			NE:       30,
			IS:       30,
			ISNULL:   30,
			NOTNULL:  30,
			BETWEEN:  20,
			IN:       20,
			MATCH:    20,
			LIKE:     20,
			REGEXP:   20,
			GLOB:     20,
			AND:      10,
			OR:        5,
		}.freeze

		def initialize(sql)
			@lexer = Lexer.new(sql, skip_spaces: true)
			@peek_buffer = []
		end

		def parse
			result = catch(:ERROR) { sql_stmt_list }

			if ErrorMessage === result
				raise SyntaxError.new(result.msg)
			else
				result
			end
		end

		def sql_stmt_list
			# Relevant `parse.y` grammar rules:
			#   input ::= cmdlist
			#   cmdlist ::= cmdlist ecmd | ecmd
			#   ecmd ::= SEMI | cmdx SEMI | explain cmdx SEMI
			#
			# Syntax diagram:
			#     ┌──────{ ; }◀─────┐
			#   ◯─┴┬─▶[ sql-stmt ]─┬┴─▶◯
			#      └───────▶───────┘
			#
			# Simplified grammar:
			#   SEMI* [sql_stmt SEMI]*
			#
			# Relevant SQLite documentation:
			#   - https://www.sqlite.org/lang.html
			#
			# A `sql_stmt_list` is zero or more statements,
			# where a `;` is the statement separator,
			# but an empty statement is allowed.
			#
			[].tap do |stmts|
				until current_token.nil?
					maybe :SEMI
					stmts << sql_stmt if current_token
					maybe :SEMI
				end
			end
		end

		def sql_stmt
			#
				# Relevant `parse.y` grammar rules:
				#   ecmd ::= SEMI | cmdx SEMI | explain cmdx SEMI
				#   explain ::= EXPLAIN | EXPLAIN QUERY PLAN
				#   cmdx ::= cmd
				#
				# Syntax diagram:
				#   ◯─┬─────────────┬▶─────────────────────┬─┬─▶[ alter-table-stmt ]──────────▶─┬─▶◯
				#     └─{ EXPLAIN }─┴─▶{ QUERY }─▶{ PLAN }─┘ ├─▶[ analyze-stmt ]──────────────▶─┤
				#                                            ├─▶[ attach-stmt ]───────────────▶─┤
				#                                            ├─▶[ begin-stmt ]────────────────▶─┤
				#                                            ├─▶[ commit-stmt ]───────────────▶─┤
				#                                            ├─▶[ create-index-stmt ]─────────▶─┤
				#                                            ├─▶[ create-table-stmt ]─────────▶─┤
				#                                            ├─▶[ create-trigger-stmt ]───────▶─┤
				#                                            ├─▶[ create-view-stmt ]──────────▶─┤
				#                                            ├─▶[ create-virtual-table-stmt ]─▶─┤
				#                                            ├─▶[ delete-stmt ]───────────────▶─┤
				#                                            ├─▶[ detach-stmt ]───────────────▶─┤
				#                                            ├─▶[ drop-index-stmt ]───────────▶─┤
				#                                            ├─▶[ drop-table-stmt ]───────────▶─┤
				#                                            ├─▶[ drop-trigger-stmt ]─────────▶─┤
				#                                            ├─▶[ drop-view-stmt ]────────────▶─┤
				#                                            ├─▶[ insert-stmt ]───────────────▶─┤
				#                                            ├─▶[ pragma-stmt ]───────────────▶─┤
				#                                            ├─▶[ reindex-stmt ]──────────────▶─┤
				#                                            ├─▶[ release-stmt ]──────────────▶─┤
				#                                            ├─▶[ rollback-stmt ]─────────────▶─┤
				#                                            ├─▶[ savepoint-stmt ]────────────▶─┤
				#                                            ├─▶[ select-stmt ]───────────────▶─┤
				#                                            ├─▶[ update-stmt ]───────────────▶─┤
				#                                            └─▶[ vacuum-stmt ]───────────────▶─┘
				# Simplified grammar:
				#   [EXPLAIN [QUERY PLAN]] stmt
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_explain.html
				#   - https://www.sqlite.org/eqp.html
				#   - https://www.sqlite.org/opcode.html
				#
				# A `sql_stmt` is a single SQL statement, optionally preceded by one of two different
				# explanation prefixes. A simple `EXPLAIN` prefix requests the bytecode instructions,
				# while `EXPLAIN QUERY PLAN` requests the query plan.
				#
				# This method doesn't consume tokens associated with the statements so that each
				# statement method can independently consume the tokens it needs.
			#
			require :PLAN if (explain = maybe :EXPLAIN) && (query_plan = maybe :QUERY)

			case current_token
			when :ALTER							then alter_table_stmt
			when :ANALYZE						then analyze_stmt
			when :ATTACH						then attach_stmt
			when :BEGIN							then begin_stmt
			when :COMMIT, :END			then commit_stmt
			when :CREATE
				case peek
				when :INDEX		then create_index_stmt
				when :TABLE		then create_table_stmt
				when :TRIGGER	then create_trigger_stmt
				when :VIEW		then create_view_stmt
				when :VIRTUAL	then create_virtual_table_stmt
				when :UNIQUE	then create_index_stmt
				when :TEMP, :TEMPORARY
					case peek(2)
					when [:TEMP, :TABLE]				then create_table_stmt
					when [:TEMP, :TRIGGER]			then create_trigger_stmt
					when [:TEMP, :VIEW]					then create_view_stmt
					when [:TEMPORARY, :TABLE]		then create_table_stmt
					when [:TEMPORARY, :TRIGGER]	then create_trigger_stmt
					when [:TEMPORARY, :VIEW]		then create_view_stmt
					else
						expected! :TABLE, :TRIGGER, :VIEW
					end
				else
					expected! :INDEX, :TABLE, :TRIGGER, :VIEW, :VIRTUAL, :UNIQUE, :TEMP, :TEMPORARY
				end
			when :DELETE						then delete_stmt
			when :DETACH						then detach_stmt
			when :DROP
				case peek
				when :INDEX		then drop_index_stmt
				when :TABLE		then drop_table_stmt
				when :TRIGGER	then drop_trigger_stmt
				when :VIEW		then drop_view_stmt
				else
					# TODO: error!()
					# unexpected_token = peek
					# *context, unexpected = values(2)
					# raise SyntaxError, <<~TXT
					# 	Unexpected token after '#{context.join(" ")}': #{unexpected_token}[#{unexpected.inspect}]
					# 	Expected one of: INDEX, TABLE, TRIGGER, VIEW
					# TXT
				end
			when :INSERT, :REPLACE	then insert_stmt
			when :PRAGMA						then pragma_stmt
			when :REINDEX						then reindex_stmt
			when :RELEASE						then release_stmt
			when :ROLLBACK					then rollback_stmt
			when :SAVEPOINT					then savepoint_stmt
			when :SELECT, :VALUES		then select_stmt
			when :UPDATE						then update_stmt
			when :VACUUM						then vacuum_stmt
			when :WITH							then select_stmt
			else
				expected!(:ALTER, :ANALYZE, :ATTACH, :BEGIN, :COMMIT, :END, :CREATE, :DELETE, :DETACH, :DROP, :INSERT, :REPLACE, :PRAGMA, :REINDEX, :RELEASE, :ROLLBACK, :SAVEPOINT, :SELECT, :UPDATE, :VACUUM, :WITH)
			end
		end

		def _not_implemented
			raise NotImplementedError, "#{__callee__} is not supported yet"
		end
		alias_method :alter_table_stmt, :_not_implemented
		alias_method :analyze_stmt, :_not_implemented
		alias_method :attach_stmt, :_not_implemented
		alias_method :begin_stmt, :_not_implemented
		alias_method :commit_stmt, :_not_implemented
		alias_method :create_index_stmt, :_not_implemented
		alias_method :create_trigger_stmt, :_not_implemented
		alias_method :create_view_stmt, :_not_implemented
		alias_method :create_virtual_table_stmt, :_not_implemented
		alias_method :delete_stmt, :_not_implemented
		alias_method :detach_stmt, :_not_implemented
		alias_method :drop_index_stmt, :_not_implemented
		alias_method :drop_table_stmt, :_not_implemented
		alias_method :drop_trigger_stmt, :_not_implemented
		alias_method :drop_view_stmt, :_not_implemented
		alias_method :insert_stmt, :_not_implemented
		alias_method :pragma_stmt, :_not_implemented
		alias_method :reindex_stmt, :_not_implemented
		alias_method :release_stmt, :_not_implemented
		alias_method :rollback_stmt, :_not_implemented
		alias_method :savepoint_stmt, :_not_implemented
		alias_method :update_stmt, :_not_implemented
		alias_method :vacuum_stmt, :_not_implemented

		# ---------- Statements ----------

		def create_table_stmt
			#
				# Relevant `parse.y` grammar rules:
				#   cmd ::= create_table create_table_args
				#   create_table ::= createkw temp TABLE ifnotexists nm dbnm
				#   create_table_args ::= LP columnlist conslist_opt RP table_option_set | AS select
				#   createkw ::= CREATE
				#   temp ::= . | TEMP
				#   ifnotexists ::= . | IF NOT EXISTS
				#   columnlist ::= columnlist COMMA columnname carglist
				#   nm ::= idj | STRING
				#   dbnm ::= . | DOT nm
				#
				# Syntax diagram:
				#   ◯─▶{ CREATE }┬───────▶──────┬▶{ TABLE }┬▶{ IF }─▶{ NOT }─▶{ EXISTS }─┐
				#                ├▶{ TEMP }─────┤          │                             │
				#                └▶{ TEMPORARY }┘          │                             │
				#   ┌─────────────────────◀────────────────┴──────────────────◀──────────┘
				#   ├─▶{ schema-name }─▶{ . }─┬▶{ table-name }┬───────▶{ AS }─▶[ select-stmt ]───▶─────┐
				#   └────────▶────────────────┘               │                                        │
				#   ┌────────────────────◀────────────────────┘                     ┌────────▶─────────┼─▶◯
				#   └▶{ ( }─┬▶[ column-def ]─┬▶┬─────────────────────────────┬▶{ ) }┴▶[ table-options ]┘
				#           └─────{ , }◀─────┘ └[ table-constraint ]◀─{ , }◀─┘
				#
				# Simplified grammar:
				#   CREATE [TEMP] TABLE [IF NOT EXISTS] name [DOT name] (
				#     LP column_def [, column_def]* [table_constraint [, table_constraint]*] RP [table_options]
				#     | AS select_stmt
				#   )
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_createtable.html
				#
				# A `create_table_stmt` creates a table.
			#
			create_kw         = require      :CREATE
			temp_kw           = maybe_one_of :TEMP, :TEMPORARY
			table_kw          = require      :TABLE
			if_not_exists_kw  = maybe_all_of :IF, :NOT, :EXISTS
			table_name        =              table_name()

			if maybe :AS
				as_select = select_stmt

				CreateTableStatement.concrete(
					full_source:      @lexer.sql,
					create_kw:        Token::Keyword(create_kw),
					temp_kw:          Token::Keyword(temp_kw),
					table_kw:         Token::Keyword(table_kw),
					if_not_exists_kw: Token::Keyword(if_not_exists_kw),
					table:            table_name,
					select_statement: as_select
				)
			elsif (columns_lp = maybe          :LP)
				columns         = require_some(trailing_sep: :COMMA) { column_def }
				# inlined `table_constraint`
				constraints     = maybe_some(trailing_sep: [:COMMA, nil].freeze) do
					#
						# Relevant `parse.y` grammar rules:
						#   conslist_opt ::= . | COMMA conslist.
						#   conslist ::= conslist tconscomma tcons | tcons
						#   tconscomma ::= . | COMMA
						#   tcons ::= CONSTRAINT nm |
						#             PRIMARY KEY LP sortlist autoinc RP onconf |
						#             UNIQUE LP sortlist RP onconf |
						#             CHECK LP expr RP onconf |
						#             FOREIGN KEY LP eidlist RP REFERENCES nm eidlist_opt refargs defer_subclause_opt
						#
						# Syntax diagram:
						#   ◯─▶┬▶{ CONSTRAINT }─▶{ name }─┐
						#      ├─────────────◀────────────┘
						#      ├─▶{ PRIMARY }─▶{ KEY }───▶{ ( }┬▶[ indexed-column ]┬┬▶{ AUTOINCREMENT }┬▶{ ) }─▶[ conflict-clause ]───┬─▶◯
						#      │                               └───────{ , }◀──────┘└────────▶─────────┘                              │
						#      ├─▶{ UNIQUE }──▶{ ( }┬▶[ indexed-column ]┬▶{ ) }─▶[ conflict-clause ]────────────────────────────────▶─┤
						#      │                    └───────{ , }◀──────┘                                                             │
						#      ├─▶{ CHECK }─▶{ ( }─▶[ expr ]─▶{ ) }─────────────────────────────────────────────────────────────────▶─┤
						#      └─▶{ FOREIGN }─▶{ KEY }─▶{ ( }┬▶[ indexed-column ]┬▶{ ) }─▶[ foreign-key-clause ]────────────────────▶─┘
						#                                    └──────{ , }◀───────┘
						#
						# Simplified grammar:
						#
						# Relevant SQLite documentation:
						#   - https://www.sqlite.org/syntax/table-constraint.html
						#
						# A set of SQL constraints for each table.
						# SQLite supports UNIQUE, NOT NULL, CHECK and FOREIGN KEY constraints.
					#
					if (constraint_kw     = maybe :CONSTRAINT)
						constraint_name     = name
					end

					if    (unique_kw      = maybe          :UNIQUE)
						unique_lp           = require        :LP
						unique_columns      = require_some(trailing_sep: :COMMA) { indexed_column }
						unique_rp           = require        :RP
						on_conflict         = maybe        { conflict_clause }

						UniqueTableConstraint.concrete(
							full_source:     @lexer.sql,
							constraint_kw:   Token::Keyword(constraint_kw),
							name_tk:         Token::Identifier(constraint_name),
							unique_kw:       Token::Keyword(unique_kw),
							unique_lp:       Token::Punctuation(unique_lp),
							columns:         unique_columns,
							unique_rp:       Token::Punctuation(unique_rp),
							conflict_clause: on_conflict,
						)
					elsif (check_kw       = maybe          :CHECK)
						check_lp            = require        :LP
						check               =                expression
						check_rp            = require        :RP

						CheckTableConstraint.concrete(
							full_source:     @lexer.sql,
							constraint_kw:   Token::Keyword(constraint_kw),
							name_tk:         Token::Identifier(constraint_name),
							check_kw:        Token::Keyword(check_kw),
							check_lp:        Token::Punctuation(check_lp),
							expression:      check,
							check_rp:        Token::Punctuation(check_rp),
						)
					elsif (primary_key_kw = maybe_all_of   :PRIMARY, :KEY)
						primary_key_lp      = require        :LP
						primary_key_columns = require_some(trailing_sep: :COMMA) { indexed_column }
						autoincrement_kw    = maybe          :AUTOINCREMENT
						primary_key_rp      = require        :RP
						on_conflict         = maybe        { conflict_clause }

						PrimaryKeyTableConstraint.concrete(
							full_source:      @lexer.sql,
							constraint_kw:    Token::Keyword(constraint_kw),
							name_tk:          Token::Identifier(constraint_name),
							primary_key_kw:   Token::Keyword(primary_key_kw),
							primary_key_lp:   Token::Punctuation(primary_key_lp),
							columns:          primary_key_columns,
							autoincrement_kw: Token::Keyword(autoincrement_kw),
							primary_key_rp:   Token::Punctuation(primary_key_rp),
							conflict_clause:  on_conflict,
						)
					elsif (foreign_key_kw = maybe_all_of   :FOREIGN, :KEY)
						foreign_key_lp      = require        :LP
						foreign_key_columns = require_some(trailing_sep: :COMMA) { indexed_column }
						foreign_key_rp      = require        :RP
						clause              =                foreign_key_clause

						ForeignKeyTableConstraint.concrete(
							full_source:        @lexer.sql,
							constraint_kw:      Token::Keyword(constraint_kw),
							name_tk:            Token::Identifier(constraint_name),
							foreign_key_kw:     Token::Keyword(foreign_key_kw),
							foreign_key_lp:     Token::Punctuation(foreign_key_lp),
							columns:            foreign_key_columns,
							foreign_key_rp:     Token::Punctuation(foreign_key_rp),
							foreign_key_clause: clause,
						)
					else
						if constraint_name
							NoOpTableConstraint.concrete(
								full_source:   @lexer.sql,
								constraint_kw: Token::Keyword(constraint_kw),
								name_tk:       Token::Identifier(constraint_name),
							)
						else
							expected!(:PRIMARY, :UNIQUE, :CHECK, :FOREIGN)
						end
					end
				end
				columns_rp      = require        :RP
				# inlined `table_options`
				options         = maybe_some(trailing_sep: :COMMA) do
					#
						# Relevant `parse.y` grammar rules:
						#   table_option_set ::= . | table_option | table_option_set COMMA table_option
						#   table_option ::= WITHOUT nm  // nm must be "ROWID"
						#   table_option ::= nm          // nm must be "STRICT"
						#
						# Syntax diagram:
						#       ┌─▶{ WITHOUT }─▶{ ROWID }─┐
						#   ◯─┬─┤                         ├─┬─▶◯
						#     │ └─▶{ STRICT }─────────────┘ │
						#     └──────◀───────────────{ , }◀─┘
						#
						# Simplified grammar:
						#   [WITHOUT ROWID | STRICT] [, [WITHOUT ROWID | STRICT]]*
						#
						# Relevant SQLite documentation:
						#   - https://www.sqlite.org/syntax/table-options.html
						#   - https://www.sqlite.org/withoutrowid.html
						#   - https://www.sqlite.org/stricttables.html
						#
						# Whether the table is a WITHOUT ROWID table.
						# Whether the table is subject to STRICT type checking.
					#
					if maybe(:STRICT)
						StrictTableOption.new
					elsif maybe_all_of(:WITHOUT, :ROWID)
						WithoutRowidTableOption.new
					else
						expected!(:STRICT, :WITHOUT)
					end
				end

				CreateTableStatement.concrete(
					full_source:      @lexer.sql,
					create_kw:        Token::Keyword(create_kw),
					temp_kw:          Token::Keyword(temp_kw),
					table_kw:         Token::Keyword(table_kw),
					if_not_exists_kw: Token::Keyword(if_not_exists_kw),
					table:            table_name,
					columns_lp:       Token::Punctuation(columns_lp),
					columns:          columns,
					columns_rp:       Token::Punctuation(columns_rp),
					options:          options,
					constraints:      constraints,
				)
			else
				expected!(:AS, :LP)
			end
		end

		def select_stmt
			#
				# Relevant `parse.y` grammar rules:
				#   select ::= WITH wqlist selectnowith |
				#              WITH RECURSIVE wqlist selectnowith |
				#              selectnowith
				#   selectnowith ::= oneselect |
				#                    selectnowith multiselect_op oneselect
				#   multiselect_op ::= UNION | UNION ALL | EXCEPT | INTERSECT
				#   orderby_opt ::= . | ORDER BY sortlist
				#   limit_opt ::= . | LIMIT expr | LIMIT expr OFFSET expr | LIMIT expr COMMA expr
				#
				# Syntax diagram:
				#   ◯─▶┬▶[ with-stmt ]─┐
				#      ├───────◀───────┘
				#   ┌──┴──────────────▶[ select-core ]───────────────────┐
				#   └──────────◀────[ compound-operator ]◀───────────────┤
				#    ┌──────────────────◀────────────────────────────────┘
				#    ├─▶{ ORDER }─▶{ BY }┬▶[ ordering-term ]─┬┐
				#    ▼                   └───────{ , }◀──────┘│
				#    ├────────────────◀───────────────────────┘
				#    ├─▶{ LIMIT }─▶[ expr ]─▶┬───────────────────────▶─┐
				#    │                       ├─▶{ OFFSET }─▶[ expr ]─▶─┤
				#    │                       └─▶{ , }─▶[ expr ]──────▶─┤
				#    └───────────────────────────────────────────────▶─┴───────▶◯
				#
				# Simplified grammar:
				#   [with_clause] select_core [compound_operator select_core]*
				#   [ORDER BY ordering_term [, ordering_term]*]
				#   [LIMIT expr [(OFFSET | COMMA) expr]]
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_select.html
				#
				# The SELECT statement is used to query the database.
			#
			with = maybe { with_clause } if current_token == :WITH
			body = select_core

			while (operator_tk = maybe_one_of [:UNION, :ALL].freeze, :UNION, :INTERSECT, :EXCEPT)
				body = CompoundSelect.concrete(
					full_source: @lexer.sql,
					operator_tk: Token::Keyword(operator_tk),
					left:        body,
					right:       select_core,
				)
			end

			if (order_by_kw = maybe_all_of :ORDER, :BY)
				orderings = require_some(trailing_sep: :COMMA) { ordering_term }
			end

			if (limit_kw = maybe :LIMIT)
				limit = expression
				if (offset_tk = maybe :OFFSET)
					offset = expression
				elsif (offset_tk = maybe :COMMA)
					# `LIMIT 5, 10` means skip 5 and take 10, the reverse of what it looks like
					offset = limit
					limit = expression
				end
			end

			SelectStatement.concrete(
				full_source: @lexer.sql,
				with_clause: with,
				body:        body,
				order_by_kw: Token::Keyword(order_by_kw),
				orderings:   orderings,
				limit_kw:    Token::Keyword(limit_kw),
				limit:       limit,
				offset_tk:   Token::Keyword(offset_tk),
				offset:      offset,
			)
		end

		def with_clause
			#
				# Relevant `parse.y` grammar rules:
				#   with ::= WITH wqlist | WITH RECURSIVE wqlist
				#   wqlist ::= wqitem | wqlist COMMA wqitem
				#   wqitem ::= withnm eidlist_opt wqas LP select RP
				#   wqas ::= AS | AS MATERIALIZED | AS NOT MATERIALIZED
				#   eidlist_opt ::= . | LP eidlist RP
				#
				# Syntax diagram:
				#   ◯─▶{ WITH }─┬──────────────────┬▶[ common-table-expression ]┬─▶◯
				#               └─▶{ RECURSIVE }─▶─┘└───────────{ , }◀──────────┘
				#
				#   ◯─▶{ table-name }┬────────────────────────────────────┬▶{ AS }┐
				#                    └▶{ ( }┬▶{ column-name }┬▶{ ) }──────┘       │
				#                           └──────{ , }◀────┘                    │
				#   ┌──────────────────────────────◀──────────────────────────────┘
				#   ├────────────────▶────────────────┬▶{ ( }─▶[ select-stmt ]─▶{ ) }─▶◯
				#   ├─▶{ NOT }─┬─▶{ MATERIALIZED }──▶─┘
				#   └────▶─────┘
				#
				# Simplified grammar:
				#   WITH [RECURSIVE] name [(column [, column]*)] AS [[NOT] MATERIALIZED] (select_stmt)
				#                    [, name [(column [, column]*)] AS [[NOT] MATERIALIZED] (select_stmt)]*
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_with.html
				#
				# Common table expressions act like temporary views that exist only for a single statement.
			#
			with_kw = require :WITH
			recursive_kw = maybe :RECURSIVE

			ctes = require_some(trailing_sep: :COMMA) do
				name_tk = name
				if (columns_lp = maybe :LP)
					columns = require_some(trailing_sep: :COMMA) { indexed_column }
					columns_rp = require :RP
				end
				as_kw = require :AS
				materialized_tk = maybe_one_of :MATERIALIZED, [:NOT, :MATERIALIZED].freeze
				select_lp = require :LP
				select = select_stmt
				select_rp = require :RP

				CommonTableExpression.concrete(
					full_source:     @lexer.sql,
					name_tk:         Token::Identifier(name_tk),
					columns_lp:      Token::Punctuation(columns_lp),
					columns:         columns,
					columns_rp:      Token::Punctuation(columns_rp),
					as_kw:           Token::Keyword(as_kw),
					materialized_tk: Token::Keyword(materialized_tk),
					select_lp:       Token::Punctuation(select_lp),
					select:          select,
					select_rp:       Token::Punctuation(select_rp),
				)
			end

			WithClause.concrete(
				full_source:  @lexer.sql,
				with_kw:      Token::Keyword(with_kw),
				recursive_kw: Token::Keyword(recursive_kw),
				ctes:         ctes,
			)
		end

		# ---------- Clauses ----------

		def expression(min_precedence = 0)
			#
				# Relevant `parse.y` grammar rules:
				#
				# Syntax diagram:
				#   ◯┬─▶[ literal-value ]───────────────────────────────────────────────────────────────────────────────────┬─▶◯
				#    ├─▶{ bind-parameter }────────────────────────────────────────────────────────────────────────────────▶─┤
				#    ├────────────────────────┬──────────────────────┐                                                      │
				#    ├─▶{ schema-name }─▶{ . }┴▶{ table-name }─▶{ . }┴▶{ column-name }────────────────────────────────────▶─┤
				#    ├─▶{ unary-operator }─▶[ expr ]──────────────────────────────────────────────────────────────────────▶─┤
				#    ├─▶[ expr ]─▶{ binary-operator }─▶[ expr ]───────────────────────────────────────────────────────────▶─┤
				#    ├─▶{ function-name }─▶{ ( }─▶[ function-arguments ]─▶{ ) }┬───────────────────┬┬─────────────────────▶─┤
				#    │       ┌──{ , }◀─┐                                       └▶[ filter-clause ]─┘└▶[ over-clause ]─────▶─┤
				#    ├─▶{ ( }┴▶[ expr ]┴▶{ ) }────────────────────────────────────────────────────────────────────────────▶─┤
				#    ├─▶{ CAST }─▶{ ( }─▶[ expr ]─▶{ AS }─▶[ type-name ]─▶{ ) }───────────────────────────────────────────▶─┤
				#    ├─▶[ expr ]─▶{ COLLATE }─▶{ collation-name }─────────────────────────────────────────────────────────▶─┤
				#    ├─▶[ expr ]┬▶{ NOT }┬┬▶{ LIKE }─────▶[ expr ]─┬────▶────────────────┬▶┬──────────────────────────────▶─┤
				#    │          └────▶───┘├▶{ GLOB }───┐           └▶{ ESCAPE }─▶[ expr ]┘ │                                │
				#    │                    ├▶{ REGEXP }─┼─▶[ expr ]────────────▶────────────┘                                │
				#    │                    └▶{ MATCH }──┘                                                                    │
				#    ├─▶[ expr ]┬▶{ ISNULL }───────┬──────────────────────────────────────────────────────────────────────▶─┤
				#    │          ├▶{ NOTNULL }──────┤                                                                        │
				#    │          └▶{ NOT }─▶{ NULL }┘                                                                        │
				#    ├─▶[ expr ]─▶{ IS }┬▶{ NOT }┬┬▶{ DISTINCT }─▶{ FROM }┬▶[ expr ]──────────────────────────────────────▶─┤
				#    │                  └────▶───┘└────────────▶──────────┘                                                 │
				#    ├─▶[ expr ]┬▶{ NOT }┬▶{ BETWEEN }─▶[ expr ]─▶{ AND }─▶[ expr ]───────────────────────────────────────▶─┤
				#    │          └────▶───┘               ┌─────────────────┐                                                │
				#    ├─▶[ expr ]┬▶{ NOT }┬▶{ IN }┬▶{ ( }─┼▶[ select-stmt ]─┼▶{ ) }────────────────────────────────────────▶─┤
				#    │          └────▶───┘       │       └─┬──▶[ expr ]──┬─┘                                                │
				#    │                           │         └────{ , }◀───┘ ┌▶{ table-name }───────────────────────────────▶─┤
				#    │                           ├────────────────────────┐│                           ┌──{ , }──┐          │
				#    │                           └─▶{ schema-name }─▶{ . }┴┴▶{ table-function }─▶{ ( }┬┴▶[ expr ]┴┬▶{ ) }─▶─┤
				#    ├────▶────┬───────────┐                                                          └─────▶─────┘         │
				#    ├─▶{ NOT }┴▶{ EXISTS }┴▶{ ( }─▶[ select-stmt ]─▶{ ) }────────────────────────────────────────────────▶─┤
				#    ├─▶{ CASE }┬▶[ expr ]┬┬▶{ WHEN }─▶[ expr ]─▶{ THEN }─▶[ expr ]┬┬▶{ ELSE }─▶[ expr ]┬▶{ END }─────────▶─┤
				#    │          └─────▶───┘└────────────────◀──────────────────────┘└─────────▶─────────┘                   │
				#    └─▶[ raise-function ]────────────────────────────────────────────────────────────────────────────────▶─┘
				#
				# Simplified grammar:
				#
				# Relevant SQLite documentation:
				#   -
				#
				# [description]
			#

			left = basic_expression

			while (operator = current_token)
				operator_precedence = OPERATOR_PRECEDENCE[operator] || -1
				break if operator_precedence < min_precedence
				next_precedence = operator_precedence + 1

				negated = maybe :NOT

				if (in_tk = maybe :IN)
					if (value_lp = maybe :LP)
						if (value_rp = maybe :RP)
							foo = ParentheticalExpression.concrete(
								full_source: @lexer.sql,
								value_lp: Token::Punctuation(value_lp),
								value: nil,
								value_rp: Token::Punctuation(value_rp),
							)

							left = BinaryExpression.concrete(
								full_source: @lexer.sql,
								operator_tk: Token::Punctuation(token_span_from(negated, in_tk)),
								left: left,
								right: foo,
							)
						elsif current_token in :SELECT | :VALUES | :WITH
							select = select_stmt
							value_rp = require :RP

							right = SubqueryExpression.concrete(
								full_source: @lexer.sql,
								select_lp: Token::Punctuation(value_lp),
								select: select,
								select_rp: Token::Punctuation(value_rp),
							)

							left = BinaryExpression.concrete(
								full_source: @lexer.sql,
								operator_tk: Token::Punctuation(token_span_from(negated, in_tk)),
								left: left,
								right: right,
							)
						elsif (e = maybe { expression })
							exprs = require_some(given: e, trailing_sep: :COMMA) do
								expression
							end
							value_rp = require :RP

							right = ParentheticalExpression.concrete(
								full_source: @lexer.sql,
								value_lp: Token::Punctuation(value_lp),
								value: exprs,
								value_rp: Token::Punctuation(value_rp),
							)

							left = BinaryExpression.concrete(
								full_source: @lexer.sql,
								operator_tk: Token::Punctuation(token_span_from(negated, in_tk)),
								left: left,
								right: right,
							)
						else
							expected!(:RP, "select-stmt", "expr")
						end
					elsif (ref = maybe { identifier })
						if maybe :DOT
							name = identifier

							if (arguments_lp = maybe :LP)
								function_name = name
								arguments = maybe_some(trailing_sep: :COMMA) { expression }
								arguments_rp = require :RP

								right = FunctionReference.concrete(
									full_source: @lexer.sql,
									schema_tk: Token::Identifier(ref),
									function_tk: Token::Identifier(name),
									arguments_lp: Token::Punctuation(arguments_lp),
									arguments: FunctionArguments.concrete(
										full_source: @lexer.sql,
										expressions: arguments
									),
									arguments_rp: Token::Punctuation(arguments_rp),
								)
							else
								right = TableName.concrete(
									full_source: @lexer.sql,
									schema_tk: Token::Identifier(ref),
									table_tk: Token::Identifier(name),
								)
							end
						elsif (arguments_lp = maybe :LP)
							arguments = maybe_some(trailing_sep: :COMMA) { expression }
							arguments_rp = require :RP

							right = FunctionReference.concrete(
								full_source: @lexer.sql,
								function_tk: Token::Identifier(ref),
								arguments_lp: Token::Punctuation(arguments_lp),
								arguments: FunctionArguments.concrete(
									full_source: @lexer.sql,
									expressions: arguments
								),
								arguments_rp: Token::Punctuation(arguments_rp),
							)
						else
							table = ref

							right = TableName.concrete(
								full_source: @lexer.sql,
								table_tk: Token::Identifier(table),
							)
						end

						left = BinaryExpression.concrete(
							full_source: @lexer.sql,
							operator_tk: Token::Punctuation(token_span_from(negated, in_tk)),
							left: left,
							right: right,
						)
					else
						expected!(:LP, :ID)
					end
				elsif (between_kw = maybe :BETWEEN)
					middle = expression(next_precedence)
					and_kw = require :AND
					right = expression(next_precedence)
					left = TernaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Keyword(token_span_from(negated, between_kw)),
						left: left,
						middle: middle,
						and_kw: Token::Keyword(and_kw),
						right: right,
					)
				elsif (like_kw = maybe :LIKE)
					expression_node = negated ? NotLikeExpression : LikeExpression
					right = expression(next_precedence)
					if (escape_kw = maybe :ESCAPE)
						escape = expression(next_precedence)
					end
					left = expression_node.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Keyword(token_span_from(negated, like_kw)),
						left: left,
						right: right,
						escape_kw: Token::Keyword(escape_kw),
						escape: escape,
					)
				elsif (match_tk = maybe_one_of :GLOB, :REGEXP, :MATCH)
					operator_tk = token_span_from(negated, match_tk)
					right = expression(next_precedence)

					left_attr = Node === left ? { left: left } : { left_tk: left }
					right_attr = Node === right ? { right: right } : { right_tk: right }

					left = BinaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Punctuation(operator_tk),
						**left_attr,
						**right_attr,
					)
				end
				next if in_tk || between_kw || like_kw || match_tk


				if negated && (null_kw = maybe :NULL)
					left = UnaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Punctuation(token_span_from(negated, null_kw)),
						operand: left,
					)
					next
				end

				expected!(:IN, :BETWEEN, :LIKE, :GLOB, :REGEXP, :MATCH, :NULL) if negated

				if (operator_tk = maybe :ISNULL)
					operand_attr = Node === left ? { operand: left } : { operand_tk: left }

					left = UnaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Punctuation(operator_tk),
						**operand_attr,
					)
				elsif (operator_tk = maybe :NOTNULL)
					operand_attr = Node === left ? { operand: left } : { operand_tk: left }

					left = UnaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Punctuation(operator_tk),
						**operand_attr,
					)
				elsif (is_tk = maybe :IS)
					negated_tk = maybe :NOT
					distinct_from_tk = maybe_all_of :DISTINCT, :FROM

					operator_tk = token_span_from(is_tk, negated_tk, distinct_from_tk)
					right = expression(next_precedence)

					left_attr = Node === left ? { left: left } : { left_tk: left }
					right_attr = Node === right ? { right: right } : { right_tk: right }

					left = BinaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Punctuation(operator_tk),
						**left_attr,
						**right_attr,
					)
				elsif (collate_kw = maybe :COLLATE)
					expression_attr = Node === left ? { expression: left } : { expression_tk: left }
					sequence = identifier_or_string()

					left = CollationExpression.concrete(
						full_source: @lexer.sql,
						collate_kw: Token::Keyword(collate_kw),
						**expression_attr,
						sequence_tk: Token::Keyword(sequence),
					)
				else
					operator_tk = require operator
					right = expression(next_precedence)

					left_attr = Node === left ? { left: left } : { left_tk: left }
					right_attr = Node === right ? { right: right } : { right_tk: right }

					left = BinaryExpression.concrete(
						full_source: @lexer.sql,
						operator_tk: Token::Punctuation(operator_tk),
						**left_attr,
						**right_attr,
					)
				end
			end

			left
		end

		def column_def
			#
				# Used by:
				#   - alter_table_stmt
				#   - create_table_stmt
				#
				# Relevant `parse.y` grammar rules:
				#   columnlist ::= columnname carglist
				#   columnname ::= nm typetoken
				#   carglist ::= . | carglist ccons
				#
				# Syntax diagram:
				#   ◯─▶{ column-name }─┬─▶[ type-name ]─┬▶┬─▶───────────────────▶──┬─▶◯
				#                      └────────▶───────┘ └─[ column-constraint ]◀─┘
				#
				# Simplified grammar:
				#   name [type] [constraint [constraint]*]
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_createtable.html#column_definitions
				#   - https://www.sqlite.org/syntax/column-def.html
				#
				# Each column definition consists of the name of the column,
				# optionally followed by the declared type of the column,
				# then one or more optional column constraints.
			#
			column_name = name
			column_type = maybe { type_name }
			constraints = maybe_some(trailing_sep: nil) do
				#
					# Relevant `parse.y` grammar rules:
					#   ccons ::= CONSTRAINT nm |
					#             DEFAULT term |
					#             DEFAULT LP expr RP |
					#             DEFAULT PLUS term |
					#             DEFAULT MINUS term |
					#             DEFAULT id |
					#             NULL onconf |
					#             NOT NULL onconf |
					#             PRIMARY KEY sortorder onconf autoinc |
					#             UNIQUE onconf |
					#             CHECK LP expr RP |
					#             REFERENCES nm eidlist_opt refargs |
					#             defer_subclause |
					#             COLLATE ids |
					#             GENERATED ALWAYS AS generated |
					#             AS generated
					#   term ::= NULL | FLOAT | BLOB | STRING | INTEGER | CTIME_KW | QNUMBER
					#   id ::= ID | INDEXED
					#   ids ::= ID | STRING
					#   nm ::= idj | STRING
					#   eidlist_opt ::= . | LP eidlist RP
					#   eidlist ::= eidlist COMMA nm collate sortorder |
					# 	            nm collate sortorder
					#   onconf ::= . | ON CONFLICT resolvetype
					#   sortorder ::= . | ASC | DESC
					#   refargs ::= . | refargs refarg
					#   refarg ::= MATCH nm |
					# 	           ON INSERT refact |
					# 	           ON DELETE refact |
					# 		         ON UPDATE refact
					#   generated ::= LP expr RP |
					#                 LP expr RP ID
					#   autoinc ::= . | AUTOINCR.
					#
					# Syntax diagram:
					#   ◯─▶┬▶{ CONSTRAINT }─▶{ name }─┬───────────────────────────────▶───────────────────────┐
					#      ├─────────────◀────────────┘                                                       │
					#      ├─▶{ PRIMARY }─▶{ KEY }──┬─────▶──────┬─▶[ conflict-clause ]┬──────────▶───────────┼─▶◯
					#      │                        ├─▶{ ASC }──▶┤                     └─▶{ AUTOINCREMENT }─▶─┤
					#      ├─────▶───┐              └─▶{ DESC }─▶┘                                            │
					#      ├─▶{ NOT }┴▶{ NULL }─▶[ conflict-clause ]────────────────────────────────────────▶─┤
					#      ├─▶{ UNIQUE }─▶[ conflict-clause ]───────────────────────────────────────────────▶─┤
					#      ├─▶{ CHECK }─▶{ ( }─▶[ expr ]─▶{ ) }─────────────────────────────────────────────▶─┤
					#      ├─▶{ DEFAULT }─▶┬▶{ ( }─▶[ expr ]─▶{ ) }──┬──────────────────────────────────────▶─┤
					#      │               ├─▶[ literal-value ]────▶─┤                                        │
					#      │               └─▶[ signed-number ]────▶─┘                                        │
					#      ├─▶{ COLLATE }─▶{ collation-name }───────────────────────────────────────────────▶─┤
					#      ├─▶[ foreign-key-clause ]────────────────────────────────────────────────────────▶─┤
					#      ├─▶{ GENERATED }─▶{ ALWAYS }┬▶{ AS }─▶{ ( }─▶[ expr ]─▶{ ) }┬────────────────────▶─┤
					#      └──────────────▶────────────┘                               ├─▶{ STORED }────────▶─┤
					#                                                                  └─▶{ VIRTUAL }───────▶─┘
					#
					# Simplified grammar:
					#   [CONSTRAINT name] (
					#     [PRIMARY KEY [ASC|DESC] [conflict_clause] [AUTOINCREMENT]]
					#     [NOT NULL [conflict_clause]]
					#     [NULL [conflict_clause]]
					#     [UNIQUE [conflict_clause]]
					#     [CHECK LP expression RP [conflict_clause]]
					#     [COLLATE collation-name]
					#     [foreign-key-clause]
					#     [GENERATED ALWAYS AS (expr) STORED | VIRTUAL]
					#   )
					#
					# Relevant SQLite documentation:
					#   - https://www.sqlite.org/lang_createtable.html#column_definitions
					#   - https://www.sqlite.org/syntax/column-constraint.html
					#
					# Included in the definition of "column constraints" for the purposes of the previous statement
					# are the COLLATE and DEFAULT clauses, even though these are not really constraints in the sense
					# that they do not restrict the data that the table may contain. The other constraints -
					# NOT NULL, CHECK, UNIQUE, PRIMARY KEY and FOREIGN KEY constraints - impose restrictions on the table data.
				#
				if (constraint_kw = maybe :CONSTRAINT)
					constraint_name = name
				end

				if    (primary_key_kw = maybe_all_of :PRIMARY, :KEY)
					direction_tk        = maybe_one_of :ASC, :DESC
					on_conflict         = maybe      { conflict_clause }
					autoincrement_kw    = maybe        :AUTOINCREMENT

					PrimaryKeyColumnConstraint.concrete(
						full_source:      @lexer.sql,
						constraint_kw:    Token::Keyword(constraint_kw),
						name_tk:          Token::Identifier(constraint_name),
						primary_key_kw:   Token::Keyword(primary_key_kw),
						direction_tk:     Token::Keyword(direction_tk),
						conflict_clause:  on_conflict,
						autoincrement_kw: Token::Keyword(autoincrement_kw),
					)
				elsif (not_null_kw    = maybe_all_of :NOT, :NULL)
					on_conflict         = maybe      { conflict_clause }

					NotNullColumnConstraint.concrete(
						full_source:     @lexer.sql,
						constraint_kw:   Token::Keyword(constraint_kw),
						name_tk:         Token::Identifier(constraint_name),
						not_null_kw:     Token::Keyword(not_null_kw),
						conflict_clause: on_conflict,
					)
				elsif (null_kw        = maybe        :NULL)
					on_conflict         = maybe      { conflict_clause }

					NullColumnConstraint.concrete(
						full_source:     @lexer.sql,
						constraint_kw:   Token::Keyword(constraint_kw),
						name_tk:         Token::Identifier(constraint_name),
						null_kw:         Token::Keyword(null_kw),
						conflict_clause: on_conflict,
					)
				elsif (unique_kw      = maybe        :UNIQUE)
					on_conflict         = maybe      { conflict_clause }

					UniqueColumnConstraint.concrete(
						full_source:     @lexer.sql,
						constraint_kw:   Token::Keyword(constraint_kw),
						name_tk:         Token::Identifier(constraint_name),
						unique_kw:       Token::Keyword(unique_kw),
						conflict_clause: on_conflict,
					)
				elsif (check_kw       = maybe        :CHECK)
					check_lp            = require      :LP
					check               =              expression
					check_rp            = require      :RP

					CheckColumnConstraint.concrete(
						full_source:   @lexer.sql,
						constraint_kw: Token::Keyword(constraint_kw),
						name_tk:       Token::Identifier(constraint_name),
						check_kw:      Token::Keyword(check_kw),
						check_lp:      Token::Punctuation(check_lp),
						expression:    check,
						check_rp:      Token::Punctuation(check_rp),
					)
				elsif (default_kw     = maybe        :DEFAULT)
					if (default_lp      = maybe        :LP)
						value         = expression
						default_rp    = require :RP

						value_attr = Node === value ? { value: value } : { value_tk: value }

						DefaultColumnConstraint.concrete(
							full_source:   @lexer.sql,
							constraint_kw: Token::Keyword(constraint_kw),
							name_tk:       Token::Identifier(constraint_name),
							default_kw:    Token::Keyword(default_kw),
							default_lp:    Token::Punctuation(default_lp),
							default_rp:    Token::Punctuation(default_rp),
							**value_attr,
						)
					elsif (number       = maybe      { signed_numeric })
						DefaultColumnConstraint.concrete(
							full_source:   @lexer.sql,
							constraint_kw: Token::Keyword(constraint_kw),
							name_tk:       Token::Identifier(constraint_name),
							default_kw:    Token::Keyword(default_kw),
							value_tk:      Token::Numeric(number),
						)
					elsif (value        = maybe      { literal_value })
						DefaultColumnConstraint.concrete(
							full_source:   @lexer.sql,
							constraint_kw: Token::Keyword(constraint_kw),
							name_tk:       Token::Identifier(constraint_name),
							default_kw:    Token::Keyword(default_kw),
							value_tk:      value,
						)
					elsif (id           = maybe      { identifier })
						DefaultColumnConstraint.concrete(
							full_source:   @lexer.sql,
							constraint_kw: Token::Keyword(constraint_kw),
							name_tk:       Token::Identifier(constraint_name),
							default_kw:    Token::Keyword(default_kw),
							value_tk:      Token::Identifier(id),
						)
					else
						expected! :LP, "literal-value", "signed-number"
					end
				elsif (collate_kw     = maybe        :COLLATE)
					collation = name

					CollateColumnConstraint.concrete(
						full_source:   @lexer.sql,
						constraint_kw: Token::Keyword(constraint_kw),
						name_tk:       Token::Identifier(constraint_name),
						collate_kw:    Token::Keyword(collate_kw),
						collation_tk:  Token::Identifier(collation),
					)
				elsif :REFERENCES == current_token
					clause = foreign_key_clause

					ForeignKeyColumnConstraint.concrete(
						full_source:        @lexer.sql,
						constraint_kw:      Token::Keyword(constraint_kw),
						name_tk:            Token::Identifier(constraint_name),
						foreign_key_clause: clause,
					)
				elsif (as_kw = maybe_all_of(:GENERATED, :ALWAYS, :AS) || maybe(:AS))
					as_lp      = require :LP
					default    = expression
					as_rp      = require :RP
					type_tk    = maybe_one_of :STORED, :VIRTUAL

					GeneratedAsColumnConstraint.concrete(
						full_source:        @lexer.sql,
						constraint_kw:      Token::Keyword(constraint_kw),
						name_tk:            Token::Identifier(constraint_name),
						as_kw:              Token::Keyword(as_kw),
						as_lp:              Token::Punctuation(as_lp),
						expression:         default,
						as_rp:              Token::Punctuation(as_rp),
						type_tk:            Token::Keyword(type_tk),
					)
				else
					if constraint_name
						NoOpColumnConstraint.concrete(
							full_source:   @lexer.sql,
							constraint_kw: Token::Keyword(constraint_kw),
							name_tk:       Token::Identifier(constraint_name),
						)
					else
						expected! :PRIMARY, :NOT, :NULL, :UNIQUE, :CHECK, :DEFAULT, :COLLATE, :REFERENCES, :GENERATED
					end
				end
			end

			ColumnDefinition.concrete(
				full_source: @lexer.sql,
				name_tk:     Token::Identifier(column_name),
				type:        column_type,
				constraints: constraints,
			)
		end

		def select_core
			#
				# Relevant `parse.y` grammar rules:
				#   oneselect ::= SELECT distinct selcollist from where_opt groupby_opt having_opt orderby_opt limit_opt |
				#                 SELECT distinct selcollist from where_opt groupby_opt having_opt window_clause orderby_opt limit_opt |
				#                 values
				#   distinct ::= DISTINCT | ALL | .
				#   from ::= . | FROM seltablist
				#   where_opt ::= . | WHERE expr
				#   groupby_opt ::= . | GROUP BY nexprlist
				#   having_opt ::= . | HAVING expr
				#   window_clause ::= WINDOW windowdefn_list
				#   windowdefn_list ::= windowdefn | windowdefn_list COMMA windowdefn
				#   windowdefn ::= nm AS LP window RP
				#   values ::= VALUES LP nexprlist RP | values COMMA LP nexprlist RP
				#
				# Syntax diagram:
				#   ◯─┬───▶{ SELECT }─┬───────▶──────┬─┬▶[ result-column ]─┐
				#     │               ├▶{ DISTINCT }─┤ └─────{ , }◀────────┤
				#     │               └▶{ ALL }─────▶┘                     │
				#     │  ┌──────────────────────────◀──────────────────────┘
				#     │  ├─▶{ FROM }┬─┬▶[ table-or-subquery ]─┬─┬─▶───┐
				#     │  │          │ └────────{ , }◀─────────┘ ▲     ▼
				#     │  │          └──▶[ join-clause ]─────────┘     │
				#     │  ├──────────────────────◀─────────────────────┘
				#     │  ├─▶{ WHERE }─▶[ expr ]─┐
				#     │  ├──────────◀───────────┘
				#     │  ├────────────▶─────────────────┐
				#     │  ├─▶{ GROUP }─▶{ BY }┬▶[ expr ]┬┴▶┬─▶{ HAVING }─▶[ expr ]─┬─┐
				#     │  ▼                   └──{ , }◀─┘  └────────▶──────────────┘ ▼
				#     │  ├─────────────────────────────◀────────────────────────────┘
				#     │  ├─▶{ WINDOW }┬▶{ window-name }─▶{ AS }─▶[ window-defn ]─┐
				#     │  │            └───────────────────{ , }◀─────────────────┤
				#     │  └──────────────────────▶─────────────────────────────▶──┴─┬───▶◯
				#     │                    ┌──{ , }◀─┐                             │
				#     └─▶{ VALUES }┬▶{ ( }─┴▶[ expr ]┴─▶{ ) }─┬─────────────────▶──┘
				#                  └──────────{ , }◀──────────┘
				#
				# Simplified grammar:
				#   SELECT [DISTINCT | ALL] result_column [, result_column]*
				#   [FROM join_clause] [WHERE expr] [GROUP BY expr [, expr]* [HAVING expr]]
				#   [WINDOW name AS window_defn [, name AS window_defn]*]
				#   | VALUES (expr [, expr]*) [, (expr [, expr]*)]*
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_select.html#select_core
				#
				# A single SELECT or VALUES, which compound operators then glue together.
			#
			if (select_kw = maybe :SELECT)
				type_tk = maybe_one_of :DISTINCT, :ALL
				columns = require_some(trailing_sep: :COMMA) { result_column }
				if (from_kw = maybe :FROM)
					source = join_clause
				end
				if (where_kw = maybe :WHERE)
					condition = expression
				end
				if (group_by_kw = maybe_all_of :GROUP, :BY)
					groupings = require_some(trailing_sep: :COMMA) { expression }
				end
				# SQLite accepts HAVING without GROUP BY, treating the whole result as one group
				if (having_kw = maybe :HAVING)
					having = expression
				end
				if (window_kw = maybe :WINDOW)
					windows = require_some(trailing_sep: :COMMA) { window_definition }
				end

				SelectCore.concrete(
					full_source: @lexer.sql,
					select_kw:   Token::Keyword(select_kw),
					type_tk:     Token::Keyword(type_tk),
					columns:     columns,
					from_kw:     Token::Keyword(from_kw),
					source:      source,
					where_kw:    Token::Keyword(where_kw),
					condition:   condition,
					group_by_kw: Token::Keyword(group_by_kw),
					groupings:   groupings,
					having_kw:   Token::Keyword(having_kw),
					having:      having,
					window_kw:   Token::Keyword(window_kw),
					windows:     windows,
				)
			elsif (values_kw = maybe :VALUES)
				rows = require_some(trailing_sep: :COMMA) do
					row_lp = require :LP
					values = require_some(trailing_sep: :COMMA) { expression }
					row_rp = require :RP

					ValuesRow.concrete(
						full_source: @lexer.sql,
						row_lp:      Token::Punctuation(row_lp),
						values:      values,
						row_rp:      Token::Punctuation(row_rp),
					)
				end

				ValuesClause.concrete(
					full_source: @lexer.sql,
					values_kw:   Token::Keyword(values_kw),
					rows:        rows,
				)
			else
				expected!(:SELECT, :VALUES)
			end
		end

		def window_definition
			#
				# Relevant `parse.y` grammar rules:
				#   windowdefn ::= nm AS LP window RP
				#
				# Syntax diagram:
				#   ◯─▶{ window-name }─▶{ AS }─▶[ window-defn ]─▶◯
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/windowfunctions.html#window_chaining
				#
				# A named window from the WINDOW clause, which OVER clauses may refer to or extend.
			#
			name_tk = name
			as_kw = require :AS
			window_lp = require :LP
			window = window_body
			window_rp = require :RP

			WindowDefinition.concrete(
				full_source: @lexer.sql,
				name_tk:     Token::Identifier(name_tk),
				as_kw:       Token::Keyword(as_kw),
				window_lp:   Token::Punctuation(window_lp),
				**window,
				window_rp:   Token::Punctuation(window_rp),
			)
		end

		# The inside of a window-defn parenthesis, shared by OVER (…) and WINDOW name AS (…)
		def window_body
			base_window_name_tk = maybe { identifier(except: [:PARTITION, :ORDER, :RANGE, :ROWS, :GROUPS]) }
			if (partition_by_kw = maybe_all_of(:PARTITION, :BY))
				partitions = require_some(trailing_sep: :COMMA) { expression }
			end
			if (order_by_kw = maybe_all_of(:ORDER, :BY))
				orderings = require_some(trailing_sep: :COMMA) { ordering_term }
			end
			if current_token in :RANGE | :ROWS | :GROUPS
				frame = frame_spec
			end

			{
				base_window_name_tk: Token::Identifier(base_window_name_tk),
				partition_by_kw:     Token::Keyword(partition_by_kw),
				partitions:          partitions,
				order_by_kw:         Token::Keyword(order_by_kw),
				orderings:           orderings,
				frame:               frame,
			}
		end

		def filter_clause
			# Relevant `parse.y` grammar rules:
			#
			# Syntax diagram:
			#   ◯─▶{ FILTER }─▶{ ( }─▶{ WHERE }─▶[ expr ]─▶{ ) }─▶◯
			#
			# Simplified grammar:
			#
			# Relevant SQLite documentation:
			#   -
			#
			# [description]
			#
			require_all_of :FILTER, :LP, :WHERE
			condition = expression
			require :RP

			condition
		end

		def over_clause
			#
				# Relevant `parse.y` grammar rules:
				#   over_clause ::= OVER LP window RP |
				#                   OVER nm
				#   window ::= nm frame_opt |
				#              frame_opt |
				#              nm ORDER BY sortlist frame_opt |
				#              ORDER BY sortlist frame_opt |
				#              nm PARTITION BY nexprlist orderby_opt frame_opt |
				#              PARTITION BY nexprlist orderby_opt frame_opt
				#   frame_opt ::= range_or_rows BETWEEN frame_bound_s AND frame_bound_e frame_exclude_opt |
				#                 range_or_rows frame_bound_s frame_exclude_opt  |
				#                 .
				#   range_or_rows ::= RANGE | ROWS | GROUPS
				#   frame_bound_s ::= frame_bound |
				#                     UNBOUNDED PRECEDING
				#   frame_bound_e ::= frame_bound |
				#                     UNBOUNDED FOLLOWING
				#   frame_exclude_opt ::= . |
				#                         EXCLUDE frame_exclude
				#   frame_bound ::= CURRENT ROW |
				#                   expr PRECEDING | FOLLOWING
				#   frame_exclude ::= NO OTHERS | CURRENT ROW | GROUP | TIES
				#   filter_clause ::= FILTER LP WHERE expr RP
				#
				# Syntax diagram:
				#   ◯─▶{ OVER }┬─▶{ window-name }───────────────────────────────┬─▶◯
				#              └─▶{ ( }┬───────────▶────────────┐               │
				#                      └─▶{ base-window-name }─▶┤               │
				#                   ┌───────────────◀───────────┘               │
				#                   ├─▶{ PARTITION }─▶{ BY }┬[ expr ]┐          │
				#                   │                       └─{ , }◀─┤          │
				#                   ├────────────◀───────────────────┘          │
				#                   ├─▶{ ORDER }─▶{ BY }┬[ ordering-term ]┐     │
				#                   │                   └──────{ , }◀─────┤     │
				#                   ├─────────────◀───────────────────────┘     │
				#                   ├─▶[ frame-spec ]┬─▶──────────────────{ ) }─┘
				#                   └─────────▶──────┘
				#
				# Simplified grammar:
				#
				# Relevant SQLite documentation:
				#   -
				#
				# [description]
			#
			over_kw = require :OVER
			if (window_lp = maybe :LP)
				window = window_body
				window_rp = require :RP

				OverClause.concrete(
					full_source: @lexer.sql,
					over_kw: Token::Keyword(over_kw),
					window_lp: Token::Punctuation(window_lp),
					**window,
					window_rp: Token::Punctuation(window_rp),
				)
			else
				window_name_tk = identifier

				OverClause.concrete(
					full_source: @lexer.sql,
					over_kw: Token::Keyword(over_kw),
					window_name_tk: Token::Identifier(window_name_tk),
				)
			end
		end

		def foreign_key_clause
			#
				# Relevant `parse.y` grammar rules:
				#   ccons ::= REFERENCES nm eidlist_opt refargs.
				#   eidlist_opt ::= . | LP eidlist RP
				#   eidlist ::= eidlist COMMA nm collate sortorder | nm collate sortorder
				#   refargs ::= . | refargs refarg
				#   refarg ::= MATCH nm |
				#              ON INSERT refact |
				#              ON DELETE refact |
				#              ON UPDATE refact
				#   refact ::= SET NULL |
				#              SET DEFAULT |
				#              CASCADE |
				#              RESTRICT |
				#              NO ACTION
				#   defer_subclause_opt ::= . | defer_subclause
				#   defer_subclause ::= NOT DEFERRABLE init_deferred_pred_opt |
				#                       DEFERRABLE init_deferred_pred_opt
				#   init_deferred_pred_opt ::= . | INITIALLY DEFERRED | INITIALLY IMMEDIATE
				#
				# Syntax diagram:
				#                                                ┌─────{ , }◀─────┐
				#   ◯─▶{ REFERENCES }─▶{ foreign-table }─┬─▶{ ( }┴▶{ column-name }┴▶{ ) }──┐
				#    ┌───────────────────────────────────┴──────────◀──┬───────────────────┘
				#    ├─▶{ ON }┬─▶{ DELETE }─┬┬─▶{ SET }─▶{ NULL }────▶─┤
				#    │        └─▶{ UPDATE }─┘├─▶{ SET }─▶{ DEFAULT }─▶─┤
				#    │                       ├─▶{ CASCADE }──────────▶─┤
				#    │                       ├─▶{ RESTRICT }─────────▶─┤
				#    │                       └─▶{ NO }─▶{ ACTION }───▶─┤
				#    ├─▶{ MATCH }─▶{ name }────────────────────────────┘
				#    ├────────────┬─▶{ DEFERRABLE }┬───────────────────────────────▶─┐
				#    ├─{ NOT }──▶─┘                ├─▶{ INITIALLY }─▶{ DEFERRED }──▶─┤
				#    │                             └─▶{ INITIALLY }─▶{ IMMEDIATE }─▶─┤
				#    └───────────────────────────────────────────────────────────────┴──────▶◯
				#
				# Simplified grammar:
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/foreign-key-clause.html
				#   - https://www.sqlite.org/foreignkeys.html
				#
				# [description]
			#
			references_kw = require :REFERENCES
			foreign_table = name(except: [:ON, :MATCH, :DEFERRABLE, :NOT])
			columns = nil
			if (columns_lp = maybe :LP)
				columns = require_some(trailing_sep: :COMMA) { indexed_column }
				columns_rp = require :RP
			end
			foreign_key_actions = maybe_some(trailing_sep: nil) do
				on_kw      = require        :ON
				trigger_kw = require_one_of :DELETE, :UPDATE
				action_kw  = require_one_of :CASCADE, :RESTRICT, [:SET, :NULL].freeze, [:SET, :DEFAULT].freeze, [:NO, :ACTION].freeze
				ForeignKeyAction.concrete(
					full_source: @lexer.sql,
					on_kw:       Token::Keyword(on_kw),
					trigger_kw:  Token::Keyword(trigger_kw),
					action_kw:   Token::Keyword(action_kw),
				)
			end
			match_clauses = maybe_some(trailing_sep: nil) do
				match_kw = require :MATCH
				type_tk  = name(except: [:ON, :MATCH, :DEFERRABLE, :NOT])
				MatchClause.concrete(
					full_source: @lexer.sql,
					match_kw:    Token::Keyword(match_kw),
					type_tk:     Token::Identifier(type_tk),
				)
			end

			deferrable_span = maybe_one_of(
				[:NOT, :DEFERRABLE, :INITIALLY, :IMMEDIATE].freeze,
				[:NOT, :DEFERRABLE, :INITIALLY, :DEFERRED].freeze,
				[:DEFERRABLE, :INITIALLY, :IMMEDIATE].freeze,
				[:DEFERRABLE, :INITIALLY, :DEFERRED].freeze,
				[:NOT, :DEFERRABLE].freeze,
				:DEFERRABLE,
			)

			ForeignKeyClause.concrete(
				full_source: @lexer.sql,
				references_kw: Token::Keyword(references_kw),
				table_tk: Token::Identifier(foreign_table),
				columns_lp: Token::Punctuation(columns_lp),
				columns: columns,
				columns_rp: Token::Punctuation(columns_rp),
				actions: foreign_key_actions,
				match_clauses: match_clauses,
				deferrable_span: Token::Keyword(deferrable_span),
			)
		end

		def conflict_clause
			#
				# Used by:
				#   - column_def
				#
				# Relevant `parse.y` grammar rules:
				#   onconf ::= . | ON CONFLICT resolvetype.
				#   orconf ::= . | OR resolvetype.
				#   resolvetype ::= raisetype |
				#                   IGNORE |
				#                   REPLACE
				#   raisetype ::= ROLLBACK |
				#                 ABORT |
				#                 FAIL
				#
				# Syntax diagram:
				#   ◯─▶┬────────────────────────────────────────┬─────▶◯
				#      └─▶{ ON }─▶{ CONFLICT }┬─▶{ ROLLBACK }─▶─┤
				#                             ├─▶{ ABORT }────▶─┤
				#                             ├─▶{ FAIL }─────▶─┤
				#                             ├─▶{ IGNORE }───▶─┤
				#                             └─▶{ REPLACE }──▶─┘
				#
				# Simplified grammar:
				#   [ON CONFLICT [ROLLBACK | ABORT | FAIL | IGNORE | REPLACE]]
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_conflict.html
				#
				# The ON CONFLICT clause is a non-standard extension specific to SQLite
				# that can appear in many other SQL commands. There are five conflict resolution
				# algorithm choices: ROLLBACK, ABORT, FAIL, IGNORE, and REPLACE.
			#
			return unless (on_conflict_kw  = maybe_all_of :ON, :CONFLICT)

			if (resolution_kw = maybe_one_of :ROLLBACK, :ABORT, :FAIL, :IGNORE, :REPLACE)
				ConflictClause.concrete(
					full_source:    @lexer.sql,
					on_conflict_kw: Token::Keyword(on_conflict_kw),
					resolution_kw:  Token::Keyword(resolution_kw),
				)
			else
				expected! :ROLLBACK, :ABORT, :FAIL, :IGNORE, :REPLACE
			end
		end

		def basic_expression
			if (operator_tk = maybe :BITNOT)
				operand = expression(OPERATOR_PRECEDENCE[:BITNOT])
				operand_attr = Node === operand ? { operand: operand } : { operand_tk: operand }

				UnaryExpression.concrete(
					full_source: @lexer.sql,
					operator_tk: Token::Punctuation(operator_tk),
					**operand_attr,
				)
			elsif (operator_tk = maybe :PLUS)
				operand = expression(OPERATOR_PRECEDENCE[:UPLUS])
				operand_attr = Node === operand ? { operand: operand } : { operand_tk: operand }

				UnaryExpression.concrete(
					full_source: @lexer.sql,
					operator_tk: Token::Punctuation(operator_tk),
					**operand_attr,
				)
			elsif (operator_tk = maybe :MINUS)
				operand = expression(OPERATOR_PRECEDENCE[:UMINUS])
				operand_attr = Node === operand ? { operand: operand } : { operand_tk: operand }

				UnaryExpression.concrete(
					full_source: @lexer.sql,
					operator_tk: Token::Punctuation(operator_tk),
					**operand_attr,
				)
			elsif (operator_tk = maybe :NOT)
				operand = expression(OPERATOR_PRECEDENCE[:NOT])
				operand_attr = Node === operand ? { operand: operand } : { operand_tk: operand }

				UnaryExpression.concrete(
					full_source: @lexer.sql,
					operator_tk: Token::Punctuation(operator_tk),
					**operand_attr,
				)
			elsif (value_lp = maybe :LP)
				if current_token in :SELECT | :VALUES | :WITH
					select = select_stmt
					select_rp = require :RP

					return SubqueryExpression.concrete(
						full_source: @lexer.sql,
						select_lp: Token::Punctuation(value_lp),
						select: select,
						select_rp: Token::Punctuation(select_rp),
					)
				end

				value = expression(0)
				# A row value like `(a, b) = (1, 2)`
				if current_token == :COMMA
					value = require_some(given: value, trailing_sep: :COMMA) { expression(0) }
				end
				value_rp = require :RP

				value_attr = (Node === value || Array === value) ? { value: value } : { value_tk: value }

				ParentheticalExpression.concrete(
					full_source: @lexer.sql,
					value_lp: Token::Punctuation(value_lp),
					**value_attr,
					value_rp: Token::Punctuation(value_rp),
				)
			elsif (cast_kw = maybe :CAST)
				expression_lp = require :LP
				e = expression
				as_kw = require :AS
				t = type_name
				expression_rp = require :RP

				CastExpression.concrete(
					full_source: @lexer.sql,
					cast_kw: Token::Keyword(cast_kw),
					expression_lp: Token::Punctuation(expression_lp),
					expression: e,
					as_kw: Token::Keyword(as_kw),
					as: t,
					expression_rp: Token::Punctuation(expression_rp),
				)
			elsif (case_kw = maybe :CASE)
				if current_token == :WHEN
					conditions = require_some(leading_sep: :WHEN) do |when_kw|
						case_predicate = expression
						then_kw = require :THEN
						case_consequence = expression

						predicate_attr = Node === case_predicate ? { predicate: case_predicate } : { predicate_tk: case_predicate }
						consequence_attr = Node === case_consequence ? { consequence: case_consequence } : { consequence_tk: case_consequence }

						CaseCondition.concrete(
							full_source: @lexer.sql,
							when_kw: Token::Keyword(when_kw),
							**predicate_attr,
							then_kw: Token::Keyword(then_kw),
							**consequence_attr,
						)
					end
					if (else_kw = maybe :ELSE)
						else_clause = expression
					end
					end_kw = require :END

					else_clause_attr = Node === else_clause ? { else_clause: else_clause } : { else_clause_tk: else_clause }

					CaseExpression.concrete(
						full_source: @lexer.sql,
						case_kw: Token::Keyword(case_kw),
						conditions: conditions,
						else_kw: Token::Keyword(else_kw),
						**else_clause_attr,
						end_kw: Token::Keyword(end_kw),
					)
				else
					predicate = expression
					conditions = require_some(leading_sep: :WHEN) do |when_kw|
						case_predicate = expression
						then_kw = require :THEN
						case_consequence = expression

						CaseCondition.concrete(
							full_source: @lexer.sql,
							when_kw: Token::Keyword(when_kw),
							predicate: case_predicate,
							then_kw: Token::Keyword(then_kw),
							consequence: case_consequence,
						)
					end
					if (else_kw = maybe :ELSE)
						else_clause = expression
					end
					end_kw = require :END

					CaseExpression.concrete(
						full_source: @lexer.sql,
						case_kw: Token::Keyword(case_kw),
						predicate: predicate,
						conditions: conditions,
						else_kw: Token::Keyword(else_kw),
						else_clause: else_clause,
						end_kw: Token::Keyword(end_kw),
					)
				end
			elsif (exists_kw = maybe :EXISTS)
				select_lp = require :LP
				select = select_stmt
				select_rp = require :RP

				ExistsExpression.concrete(
					full_source: @lexer.sql,
					exists_kw: Token::Keyword(exists_kw),
					select_lp: Token::Punctuation(select_lp),
					select: select,
					select_rp: Token::Punctuation(select_rp),
				)
			# A string followed by a dot is a quoted table name, as in `'t'.col`
			elsif !(current_token == :STRING && peek == :DOT) && (literal_tk = maybe { literal_value })
				LiteralExpression.concrete(
					full_source: @lexer.sql,
					value_tk: literal_tk,
				)
			elsif (id = maybe { name(except: [:RAISE]) })
				case current_token
				in :IN
					ColumnName.concrete(
						full_source: @lexer.sql,
						column_tk: Token::Identifier(id),
					)
				in :LP
					arguments_lp = require :LP
					arguments = function_arguments
					arguments_rp = require :RP
					# WITHIN is too new to be in our keyword list, so it arrives as an identifier
					if current_token == :ID && peek == :GROUP && current_value.casecmp?("within")
						within_group_kw = require_all_of :ID, :GROUP
						within_lp = require :LP
						require_all_of :ORDER, :BY
						within_group = expression
						within_rp = require :RP
					end
					filter = maybe { filter_clause }
					over = maybe { over_clause }

					FunctionReference.concrete(
						full_source: @lexer.sql,
						function_tk: Token::Identifier(id),
						arguments_lp: Token::Punctuation(arguments_lp),
						arguments: arguments,
						arguments_rp: Token::Punctuation(arguments_rp),
						within_group_kw: Token::Keyword(within_group_kw),
						within_lp: Token::Punctuation(within_lp),
						within_group: within_group,
						within_rp: Token::Punctuation(within_rp),
						filter_clause: filter,
						over_clause: over,
					)
				in :DOT
					schema_or_table_name = id
					dot = require :DOT
					table_or_column_name = name
					if (dot2 = maybe :DOT)
						column_name = name
						ColumnName.concrete(
							full_source: @lexer.sql,
							schema_tk: Token::Identifier(schema_or_table_name),
							dot1: Token::Punctuation(dot),
							table_tk: Token::Identifier(table_or_column_name),
							dot2: Token::Punctuation(dot2),
							column_tk: Token::Identifier(column_name),
						)
					else
						ColumnName.concrete(
							full_source: @lexer.sql,
							table_tk: Token::Identifier(schema_or_table_name),
							dot2: Token::Punctuation(dot),
							column_tk: Token::Identifier(table_or_column_name),
						)
					end
				else
					ColumnName.concrete(
						full_source: @lexer.sql,
						column_tk: Token::Identifier(id),
					)
				end
			elsif :RAISE == current_token
				raise_function
			elsif (variable_tk = maybe :VARIABLE)
				Variable.concrete(
					full_source: @lexer.sql,
					name_tk: Token::Variable(variable_tk),
				)
			else
				expected!("<basic expression>")
			end
		end

		def raise_function
			#
				# Relevant `parse.y` grammar rules:
				#    expr ::= RAISE LP IGNORE RP | RAISE LP raisetype COMMA expr RP
				#    raisetype ::= ROLLBACK | ABORT | FAIL
				#
				# Syntax diagram:
				#   ◯─▶{ RAISE }─▶{ ( }┬─▶{ IGNORE }────────────────────▶─────────┬▶{ ) }──▶◯
				#                      ├─▶{ ROLLBACK }─┬▶{ , }─▶{ error-message }─┘
				#                      ├─▶{ ABORT }──▶─┤
				#                      └─▶{ FAIL }───▶─┘
				#
				# Simplified grammar:
				#   RAISE LP (IGNORE | (ROLLBACK | ABORT | FAIL) COMMA expr) RP
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/raise-function.html
				#   - https://www.sqlite.org/lang_createtrigger.html#the_raise_function
				#
				# The special RAISE expression that may _only_ occur in trigger programs.
			#
			raise_kw = require :RAISE
			raise_lp = require :LP
			if (ignore_kw = maybe :IGNORE)
				raise_rp = require :RP

				RaiseExpression.concrete(
					full_source: @lexer.sql,
					raise_kw: Token::Keyword(raise_kw),
					raise_lp: Token::Punctuation(raise_lp),
					type_kw: Token::Keyword(ignore_kw),
					raise_rp: Token::Punctuation(raise_rp),
				)
			elsif (rollback_kw = maybe :ROLLBACK)
				comma_tk = require :COMMA
				error_message = expression
				error_message.leading = Token::Punctuation(comma_tk)
				raise_rp = require :RP

				RaiseExpression.concrete(
					full_source: @lexer.sql,
					raise_kw: Token::Keyword(raise_kw),
					raise_lp: Token::Punctuation(raise_lp),
					type_kw: Token::Keyword(rollback_kw),
					raise_rp: Token::Punctuation(raise_rp),
					error_message: error_message,
				)
			elsif (abort_kw = maybe :ABORT)
				comma_tk = require :COMMA
				error_message = expression
				error_message.leading = Token::Punctuation(comma_tk)
				raise_rp = require :RP

				RaiseExpression.concrete(
					full_source: @lexer.sql,
					raise_kw: Token::Keyword(raise_kw),
					raise_lp: Token::Punctuation(raise_lp),
					type_kw: Token::Keyword(abort_kw),
					raise_rp: Token::Punctuation(raise_rp),
					error_message: error_message,
				)
			elsif (fail_kw = maybe :FAIL)
				comma_tk = require :COMMA
				error_message = expression
				error_message.leading = Token::Punctuation(comma_tk)
				raise_rp = require :RP

				RaiseExpression.concrete(
					full_source: @lexer.sql,
					raise_kw: Token::Keyword(raise_kw),
					raise_lp: Token::Punctuation(raise_lp),
					type_kw: Token::Keyword(fail_kw),
					raise_rp: Token::Punctuation(raise_rp),
					error_message: error_message,
				)
			else
				expected!(:IGNORE, :ROLLBACK, :ABORT, :FAIL)
			end
		end

		def function_arguments
			#
				# Relevant `parse.y` grammar rules:
				#   expr ::= idj LP distinct exprlist RP
				#            idj LP distinct exprlist ORDER BY sortlist RP
				#            idj LP STAR RP
				#            idj LP distinct exprlist RP filter_over
				#            idj LP distinct exprlist ORDER BY sortlist RP filter_over
				#            idj LP STAR RP filter_over
				#            idj LP distinct exprlist RP WITHIN GROUP LP ORDER BY expr RP filter_over
				#   distinct ::= DISTINCT | ALL | .
				#   exprlist ::= nexprlist | .
				#   nexprlist ::= nexprlist COMMA expr | expr
				#
				# Syntax diagram:
				#       ┌─▶{ DISTINCT }─▶┐ ┌──{ , }◀─┐
				#   ◯─▶─┼────────────────┴▶┴▶[ expr ]┼───────────┬─┬─▶◯
				#       │ ┌──────────────────────────┘           │ │
				#       │ └▶{ ORDER }─▶{ BY }┬▶[ ordering-term ]─┤ │
				#       │                    └───────{ , }◀──────┘ │
				#       └─────────────────┬▶{ * }┬▶────────────────┘
				#                         └───▶──┘
				#
				# Simplified grammar:
				#
				# Relevant SQLite documentation:
				#   -
				#
				# [description]
			#
			if (distinct_kw = maybe_one_of :DISTINCT, :ALL)
				expressions = require_some(trailing_sep: :COMMA) { expression }
				if (order_by_kw = maybe_all_of :ORDER, :BY)
					order_by = require_some(trailing_sep: :COMMA) { ordering_term }
				end

				FunctionArguments.concrete(
					full_source: @lexer.sql,
					distinct_kw: Token::Keyword(distinct_kw),
					expressions: expressions,
					order_by_kw: Token::Keyword(order_by_kw),
					order_by: order_by,
				)
			elsif maybe :STAR
				StarFunctionArgument.new
			elsif (e = maybe { expression })
				expressions = require_some(given: e, trailing_sep: :COMMA) { expression }
				if (order_by_kw = maybe_all_of :ORDER, :BY)
					order_by = require_some(trailing_sep: :COMMA) { ordering_term }
				end

				FunctionArguments.concrete(
					full_source: @lexer.sql,
					expressions: expressions,
					order_by_kw: Token::Keyword(order_by_kw),
					order_by: order_by,
				)
			elsif :RP == current_token
				EmptyFunctionArgument.new
			else
				expected!(:DISTINCT, :STAR, :RP, "expr")
			end
		end

		def frame_spec
			# Relevant `parse.y` grammar rules:
			#
			# Syntax diagram:
			#   ◯┬─▶{ RANGE }──┬┬▶{ BETWEEN }┬─▶{ UNBOUNDED }─▶{ PRECEDING }┬▶{ AND }┬─▶[ expr ]─▶{ PRECEDING }────▶─┐
			#    ├─▶{ ROWS }───┤│            ├─▶[ expr ]─▶{ PRECEDING }─────┤        ├─▶{ CURRENT }─▶{ ROW }───────▶─┤
			#    └─▶{ GROUPS }─┘│            ├─▶{ CURRENT }─▶{ ROW }────────┤        ├─▶[ expr ]─▶{ FOLLOWING }────▶─┤
			#                   │            └─▶[ expr ]─▶{ FOLLOWING }─────┘        └─▶{ UNBOUNDED }─▶{ FOLLOWING }─┤
			#                   ├─▶{ UNBOUNDED }─▶{ PRECEDING }────────────────────────────────────────────────────▶─┤
			#                   ├─▶[ expr ]─▶{ PRECEDING }─────────────────────────────────────────────────────────▶─┤
			#                   └─▶{ CURRENT }─▶{ ROW }────────────────────────────────────────────────────────────▶─┤
			#                                           ┌────────────────────────────────────────────────────────────┘
			#                                           ├─▶{ EXCLUDE }─▶{ NO }─▶{ OTHERS }───▶─┐
			#                                           ├─▶{ EXCLUDE }─▶{ CURRENT }─▶{ ROW }─▶─┤
			#                                           ├─▶{ EXCLUDE }─▶{ GROUP }────────────▶─┤
			#                                           ├─▶{ EXCLUDE }─▶{ TIES }─────────────▶─┤
			#                                           └──────────────────────────────────────┴─────────▶◯
			#
			# Simplified grammar:
			#
			# Relevant SQLite documentation:
			#   -
			#
			# [description]
			#
			if current_token in :RANGE | :ROWS | :GROUPS
				type = current_token
				type_tk = require current_token
				if (between_kw = maybe :BETWEEN)
					if (unbounded_kw = maybe :UNBOUNDED)
						precedence = 1
						preceding_kw = maybe :PRECEDING
						starting_boundary = FrameBoundary.concrete(
							full_source: @lexer.sql,
							type_tk: Token::Keyword(preceding_kw),
							value_tk: Token::Keyword(unbounded_kw),
						)
					elsif (current_row_kw = maybe_all_of :CURRENT, :ROW)
						precedence = 3
						starting_boundary = FrameBoundary.concrete(
							full_source: @lexer.sql,
							type_tk: Token::Keyword(current_row_kw),
						)
					elsif (e = maybe { expression })
						if (preceding_kw = maybe :PRECEDING)
							precedence = 2
							starting_boundary = FrameBoundary.concrete(
								full_source: @lexer.sql,
								type_tk: Token::Keyword(preceding_kw),
								value: e
							)
						elsif (following_kw = maybe :FOLLOWING)
							precedence = 4
							starting_boundary = FrameBoundary.concrete(
								full_source: @lexer.sql,
								type_tk: Token::Keyword(following_kw),
								value: e
							)
						else
							expected!(:PRECEDING, :FOLLOWING)
						end
					else
						expected!("UNBOUNDED PRECEDING", "CURRENT ROW", "expr")
					end
					and_kw = require :AND
					if (current_row_kw = maybe_all_of :CURRENT, :ROW)
						expected!("UNBOUNDED FOLLOWING", "expr") if 3 < precedence
						ending_boundary = FrameBoundary.concrete(
							full_source: @lexer.sql,
							type_tk: Token::Keyword(current_row_kw),
						)
					elsif (unbounded_kw = maybe :UNBOUNDED)
						following_kw = maybe :FOLLOWING
						ending_boundary = FrameBoundary.concrete(
							full_source: @lexer.sql,
							type_tk: Token::Keyword(following_kw),
							value_tk: Token::Keyword(unbounded_kw),
						)
					elsif (e = maybe { expression })
						if (preceding_kw = maybe :PRECEDING)
							expected!("CURRENT ROW", "UNBOUNDED FOLLOWING", "expr") if 2 < precedence
							ending_boundary = FrameBoundary.concrete(
								full_source: @lexer.sql,
								type_tk: Token::Keyword(preceding_kw),
								value: e
							)
						elsif (following_kw = maybe :FOLLOWING)
							expected!("UNBOUNDED FOLLOWING") if 4 < precedence
							ending_boundary = FrameBoundary.concrete(
								full_source: @lexer.sql,
								type_tk: Token::Keyword(following_kw),
								value: e
							)
						else
							expected!(:PRECEDING, :FOLLOWING)
						end
					else
						expected!("CURRENT ROW", "UNBOUNDED FOLLOWING", "expr")
					end
				elsif (unbounded_kw = maybe :UNBOUNDED)
					preceding_kw = maybe :PRECEDING
					starting_boundary = FrameBoundary.concrete(
						full_source: @lexer.sql,
						type_tk: Token::Keyword(preceding_kw),
						value_tk: Token::Keyword(unbounded_kw),
					)
					ending_boundary = nil
				elsif (current_row_kw = maybe_all_of :CURRENT, :ROW)
					starting_boundary = FrameBoundary.concrete(
						full_source: @lexer.sql,
						type_tk: Token::Keyword(current_row_kw),
					)
					ending_boundary = nil
				elsif (e = maybe { expression })
					preceding_kw = require :PRECEDING
					starting_boundary = FrameBoundary.concrete(
						full_source: @lexer.sql,
						type_tk: Token::Keyword(preceding_kw),
						value: e
					)
					ending_boundary = nil
				else
					expected!(:BETWEEN, :UNBOUNDED, :CURRENT, "expr")
				end

				if (exclude_kw = maybe :EXCLUDE)
					exclude_tk = require_one_of(:GROUP, :TIES, [:NO, :OTHERS].freeze, [:CURRENT, :ROW].freeze)
				end

				FrameSpec.concrete(
					full_source: @lexer.sql,
					type_tk: Token::Keyword(type_tk),
					between_kw: Token::Keyword(between_kw),
					and_kw: Token::Keyword(and_kw),
					starting_boundary: starting_boundary,
					ending_boundary: ending_boundary,
					exclude_kw: Token::Keyword(exclude_kw),
					exclude_tk: Token::Keyword(exclude_tk),
				)
			else
				expected!(:RANGE, :ROWS, :GROUPS)
			end
		end

		# ---------- Objects ----------

		def type_name
			#
				# Used by:
				#   - column_def
				#   - expression
				#
				# Relevant `parse.y` grammar rules:
				#   typetoken ::= . | typename. | typename LP signed RP | typename LP signed COMMA signed RP
				#   typename ::= ids | typename ids
				#   signed ::= plus_num | minus_num
				#   plus_num ::= PLUS number | number
				#   minus_num ::= MINUS number
				#   number ::= INTEGER | FLOAT
				#
				# Syntax diagram:
				#   ◯─┬▶{ name }─┬┬──────────────────────────────▶─────────────────────────────┬─▶◯
				#     └────◀─────┘├─▶{ ( }─▶[ signed-number ]─▶{ ) }─────────────────────────▶─┤
				#                 └─▶{ ( }─▶[ signed-number ]─▶{ , }─▶[ signed-number ]─▶{ ) }─┘
				#
				# Simplified grammar:
				#   name [name]* [LP signed_number [, signed_number] RP]
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/type-name.html
				#   - https://www.sqlite.org/datatype3.html
				#   - https://www.sqlite.org/flextypegood.html
				#
				# A typetoken is really zero or more tokens that form a type name such
				# as can be found after the column name in a CREATE TABLE statement.
				# Multiple tokens are concatenated to form the value of the typetoken.
			#
			text = scan do
				require_some(trailing_sep: nil) do
					identifier_or_string(
						# Don't consume tokens that mark the start of a `column_constraint`
						except: Set[:CONSTRAINT, :PRIMARY, :NOT, :NULL, :UNIQUE, :CHECK, :DEFAULT, :COLLATE, :REFERENCES, :GENERATED, :AS]
					)
				end
				if maybe :LP
					signed_number
					signed_number if maybe :COMMA
					require :RP
				end
			end

			ColumnType.concrete(
				full_source: @lexer.sql,
				text_span: Token::Keyword(text),
			)
		end

		def table_name
			#
				# Used by:
				#   - drop table
				#   - delete
				#   - update
				#   - insert
				#   - alter table
				#
				# Relevant `parse.y` grammar rules:
				#   fullname ::= nm | nm DOT nm
				#
				# Syntax diagram:
				#   ◯─▶┬▶{ schema-name }─▶{ . }┬▶{ object-name }─▶◯
				#      └───────────▶───────────┘
				#
				# Simplified grammar:
				#   name [DOT name]
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/lang_createtable.html
				#   - https://www.sqlite.org/lang_createvtab.html
				#
				# A table or virtual table name, where the schema name is optional.
			#

			if peek == :DOT
				schema_tk = name
				dot_tk    = require :DOT
				table_tk  = name

				TableName.concrete(
					full_source: @lexer.sql,
					schema_tk:   Token::Identifier(schema_tk),
					dot_tk:      Token::Punctuation(dot_tk),
					table_tk:    Token::Identifier(table_tk),
				)
			else
				table_tk = name

				TableName.concrete(
					full_source: @lexer.sql,
					table_tk:    Token::Identifier(table_tk),
				)
			end
		end

		def result_column
			#
				# Relevant `parse.y` grammar rules:
				#   selcollist ::= sclp expr as | sclp STAR | sclp nm DOT STAR
				#   sclp ::= selcollist COMMA | .
				#   as ::= AS nm | ids | .
				#   nm ::= idj | STRING
				#
				# Syntax diagram:
				#   ◯┬─▶[ expr ]─┬─────────────▶───────────────┬─▶◯
				#    │           ├─▶{ AS }┬▶{ column-alias }─▶─┤
				#    │           └────▶───┘                    │
				#    ├─▶{ * }────────────────────────────────▶─┤
				#    └─▶{ table-name }─▶{ . }─▶{ * }─────────▶─┘
				#
				# Simplified grammar:
				#   expr [[AS] alias] | * | table.*
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/result-column.html
				#
				# One of the columns a select core returns.
			#
			if (star_tk = maybe :STAR)
				StarResultColumn.concrete(
					full_source: @lexer.sql,
					star_tk:     Token::Punctuation(star_tk),
				)
			elsif peek(2) == [:DOT, :STAR]
				table_tk = name
				dot_tk = require :DOT
				star_tk = require :STAR

				StarResultColumn.concrete(
					full_source: @lexer.sql,
					table_tk:    Token::Identifier(table_tk),
					dot_tk:      Token::Punctuation(dot_tk),
					star_tk:     Token::Punctuation(star_tk),
				)
			else
				result = expression
				as_kw, alias_tk = as_alias
				result_attr = Node === result ? { result: result } : { result_tk: result }

				ResultColumn.concrete(
					full_source: @lexer.sql,
					**result_attr,
					as_kw:       Token::Keyword(as_kw),
					alias_tk:    Token::Identifier(alias_tk),
				)
			end
		end

		# `as ::= AS nm | ids | .` - without the AS only an identifier or a string will do,
		# so keywords like INDEXED or the join keywords are never mistaken for an alias
		def as_alias
			if (as_kw = maybe :AS)
				[as_kw, name]
			else
				[nil, maybe { identifier_or_string }]
			end
		end

		def join_clause
			#
				# Relevant `parse.y` grammar rules:
				#   seltablist ::= stl_prefix nm dbnm as on_using |
				#                  stl_prefix nm dbnm as indexed_by on_using |
				#                  stl_prefix nm dbnm LP exprlist RP as on_using |
				#                  stl_prefix LP select RP as on_using |
				#                  stl_prefix LP seltablist RP as on_using
				#   stl_prefix ::= seltablist joinop | .
				#   joinop ::= COMMA | JOIN | JOIN_KW JOIN | JOIN_KW nm JOIN | JOIN_KW nm nm JOIN
				#   on_using ::= ON expr | USING LP idlist RP | .
				#
				# Syntax diagram:
				#   ◯─▶[ table-or-subquery ]┬───────────────────────────────▶────────────────────────────────┬─▶◯
				#                           └┬▶[ join-operator ]─▶[ table-or-subquery ]─▶[ join-constraint ]┬┘
				#                            └───────────────────────────────◀──────────────────────────────┘
				#
				# Simplified grammar:
				#   table_or_subquery [join_operator table_or_subquery [join_constraint]]*
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/join-clause.html
				#
				# Everything after FROM. A comma between sources is a join operator as well.
			#
			left = table_or_subquery
			joins = []

			while (operator = join_operator)
				source = table_or_subquery
				constraint = join_constraint

				joins << Join.concrete(
					full_source: @lexer.sql,
					operator:    operator,
					source:      source,
					constraint:  constraint,
				)
			end

			return left if joins.empty?

			JoinClause.concrete(
				full_source: @lexer.sql,
				left:        left,
				joins:       joins,
			)
		end

		JOIN_KEYWORDS = Set[:NATURAL, :LEFT, :RIGHT, :FULL, :INNER, :OUTER, :CROSS].freeze

		def join_operator
			#
				# Syntax diagram:
				#   ◯┬──────────────▶─────────────────────────────────────────┬─▶◯
				#    ├─▶{ , }──────────────────────────────────────────────▶─┤
				#    ├─▶{ NATURAL }─┬┬─▶{ LEFT }──┬┬────────────┬┬▶{ JOIN }─┘
				#    └──────▶───────┘├─▶{ RIGHT }─┤└▶{ OUTER }─▶┘│
				#                    ├─▶{ FULL }──┘              │
				#                    ├─▶{ INNER }───────────────▶┤
				#                    └─▶{ CROSS }───────────────▶┘
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/join-operator.html
			#
			if (comma_tk = maybe :COMMA)
				return JoinOperator.concrete(
					full_source: @lexer.sql,
					operator_tk: Token::Punctuation(comma_tk),
				)
			end

			keywords = []
			keywords << advance while keywords.size < 3 && JOIN_KEYWORDS.include?(current_token)
			join_tk = keywords.any? ? require(:JOIN) : maybe(:JOIN)
			return unless join_tk

			JoinOperator.concrete(
				full_source: @lexer.sql,
				operator_tk: Token::Keyword(token_span_from(*keywords, join_tk)),
			)
		end

		def join_constraint
			#
				# Syntax diagram:
				#   ◯─┬─▶{ ON }─▶[ expr ]─────────────────────────────▶─┬─▶◯
				#     ├─▶{ USING }─▶{ ( }┬▶{ column-name }┬▶{ ) }────▶─┤
				#     │                  └──────{ , }◀────┘             │
				#     └────────────────────────▶────────────────────────┘
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/join-constraint.html
			#
			if (on_kw = maybe :ON)
				JoinOnConstraint.concrete(
					full_source: @lexer.sql,
					on_kw:       Token::Keyword(on_kw),
					expression:  expression,
				)
			elsif (using_kw = maybe :USING)
				columns_lp = require :LP
				columns = require_some(trailing_sep: :COMMA) do
					ColumnName.concrete(
						full_source: @lexer.sql,
						column_tk:   Token::Identifier(name),
					)
				end
				columns_rp = require :RP

				JoinUsingConstraint.concrete(
					full_source: @lexer.sql,
					using_kw:    Token::Keyword(using_kw),
					columns_lp:  Token::Punctuation(columns_lp),
					columns:     columns,
					columns_rp:  Token::Punctuation(columns_rp),
				)
			end
		end

		def table_or_subquery
			#
				# Relevant `parse.y` grammar rules:
				#   seltablist ::= stl_prefix nm dbnm as on_using |
				#                  stl_prefix nm dbnm as indexed_by on_using |
				#                  stl_prefix nm dbnm LP exprlist RP as on_using |
				#                  stl_prefix LP select RP as on_using |
				#                  stl_prefix LP seltablist RP as on_using
				#   indexed_by ::= INDEXED BY nm | NOT INDEXED
				#   as ::= AS nm | ids | .
				#   dbnm ::= . | DOT nm
				#
				# Syntax diagram:
				#                                              ┌───────┬────────────────┐
				#   ◯┬─────────────────────────┬─{ table-name }┴▶{ AS }┴▶{ table-alias }┴┬──────────┬─▶◯
				#    ├─▶{ schema-name }─▶{ . }─┤   ┌───────────────────◀─────────────────┘          │
				#    │                         │   ├─▶{ INDEXED }─▶{ BY }─▶{ index-name }─────────▶─┤
				#    │                         │   └─▶{ NOT }─▶{ INDEXED }────────────────────────▶─┤
				#    │                         │                                 ┌──{ , }◀─┐        │
				#    ├─▶───────────────────────┴───{ table-function-name }─▶{ ( }┴▶[ expr ]┴▶{ ) }┬─┤
				#    │                                               ┌────────┬───────◀───────────┘ │
				#    │                                ┌──────────────┴▶{ AS }┬┴▶{ table-alias }───▶─┤
				#    ├─▶{ ( }─▶[ select-stmt ]─▶{ ) }─┴──────────────────────┴────────────────────▶─┤
				#    └─▶{ ( }┬┬▶[ table-or-subquery ]┬┬▶{ ) }─────────────────────────────────────▶─┘
				#            │└─────────{ , }◀───────┘│
				#            └─▶────[ join-clause ]───┘
				#
				# Simplified grammar:
				#   [schema .] table [[AS] alias] [INDEXED BY index | NOT INDEXED]
				#   | [schema .] function (expr [, expr]*) [[AS] alias]
				#   | (select_stmt) [[AS] alias]
				#   | (join_clause) [[AS] alias]
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/table-or-subquery.html
				#
				# One source of rows in a FROM clause.
			#
			if (source_lp = maybe :LP)
				if current_token in :SELECT | :VALUES | :WITH
					select = select_stmt
					source_rp = require :RP
					as_kw, alias_tk = as_alias

					SubquerySource.concrete(
						full_source: @lexer.sql,
						select_lp:   Token::Punctuation(source_lp),
						select:      select,
						select_rp:   Token::Punctuation(source_rp),
						as_kw:       Token::Keyword(as_kw),
						alias_tk:    Token::Identifier(alias_tk),
					)
				else
					source = join_clause
					source_rp = require :RP
					as_kw, alias_tk = as_alias

					ParentheticalSource.concrete(
						full_source: @lexer.sql,
						source_lp:   Token::Punctuation(source_lp),
						source:      source,
						source_rp:   Token::Punctuation(source_rp),
						as_kw:       Token::Keyword(as_kw),
						alias_tk:    Token::Identifier(alias_tk),
					)
				end
			else
				schema_tk = nil
				object_tk = name
				if (dot_tk = maybe :DOT)
					schema_tk = object_tk
					object_tk = name
				end

				if (arguments_lp = maybe :LP)
					arguments = maybe_some(trailing_sep: :COMMA) { expression }
					arguments_rp = require :RP
					as_kw, alias_tk = as_alias

					TableFunction.concrete(
						full_source:  @lexer.sql,
						schema_tk:    Token::Identifier(schema_tk),
						dot_tk:       Token::Punctuation(dot_tk),
						function_tk:  Token::Identifier(object_tk),
						arguments_lp: Token::Punctuation(arguments_lp),
						arguments:    arguments,
						arguments_rp: Token::Punctuation(arguments_rp),
						as_kw:        Token::Keyword(as_kw),
						alias_tk:     Token::Identifier(alias_tk),
					)
				else
					as_kw, alias_tk = as_alias
					if (indexed_kw = maybe_all_of :INDEXED, :BY)
						index_tk = name
					else
						indexed_kw = maybe_all_of :NOT, :INDEXED
					end

					TableName.concrete(
						full_source: @lexer.sql,
						schema_tk:   Token::Identifier(schema_tk),
						dot_tk:      Token::Punctuation(dot_tk),
						table_tk:    Token::Identifier(object_tk),
						as_kw:       Token::Keyword(as_kw),
						alias_tk:    Token::Identifier(alias_tk),
						indexed_kw:  Token::Keyword(indexed_kw),
						index_tk:    Token::Identifier(index_tk),
					)
				end
			end
		end

		def literal_value
			#
				# Relevant `parse.y` grammar rules:
				#   term ::= NULL | FLOAT | BLOB | STRING | INTEGER | CTIME_KW | QNUMBER
				#
				# Syntax diagram:
				#   ◯─┬─▶{ numeric-literal }────▶─┬─▶◯
				#     ├─▶{ string-literal }─────▶─┤
				#     ├─▶{ blob-literal }───────▶─┤
				#     ├─▶{ NULL }───────────────▶─┤
				#     ├─▶{ TRUE }───────────────▶─┤
				#     ├─▶{ FALSE }──────────────▶─┤
				#     ├─▶{ CURRENT_TIME }───────▶─┤
				#     ├─▶{ CURRENT_DATE }───────▶─┤
				#     └─▶{ CURRENT_TIMESTAMP }──▶─┘
				#
				# Simplified grammar:
				#   NULL | CURRENT_TIME | CURRENT_DATE | CURRENT_TIMESTAMP | INTEGER | FLOAT | STRING | BLOB | TRUE | FALSE | QNUMBER
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/literal-value.html
				#
				# A value
			#
			case current_token
			when :NULL
				tk = require :NULL
				Token::Null(tk)
			when :CURRENT_TIME
				tk = require :CURRENT_TIME
				Token::Current(tk)
			when :CURRENT_DATE
				tk = require :CURRENT_DATE
				Token::Current(tk)
			when :CURRENT_TIMESTAMP
				tk = require :CURRENT_TIMESTAMP
				Token::Current(tk)
			when :TRUE
				tk = require :TRUE
				Token::True(tk)
			when :FALSE
				tk = require :FALSE
				Token::False(tk)
			when :QNUMBER
				tk = require :QNUMBER
				Token::Numeric(tk)
			when :INTEGER
				tk = require :INTEGER
				Token::Numeric(tk)
			when :FLOAT
				tk = require :FLOAT
				Token::Numeric(tk)
			when :STRING
				tk = require :STRING
				Token::String(tk)
			when :BLOB
				tk = require :BLOB
				Token::Blob(tk)
			else
				expected!(:INTEGER, :FLOAT, :QNUMBER, :STRING, :BLOB, :NULL, :TRUE, :FALSE, :CURRENT_TIME, :CURRENT_DATE, :CURRENT_TIMESTAMP)
			end
		end

		def indexed_column
			# Used by:
			#   - ccons, tcons, creat-view, cte
			#
			# Relevant `parse.y` grammar rules:
			#   eidlist ::= eidlist COMMA nm collate sortorder | nm collate sortorder
			#   collate ::= . | COLLATE ids.
			#   sortorder ::= . | ASC | DESC
			#   nm ::= idj | STRING
			#
			# Syntax diagram:
			#   ◯──▶{ column-name }─┬─▶───────────────────────────────┬┬────────▶───┬──▶◯
			#                       └─▶{ COLLATE }─▶{ collation-name }┘├─▶{ ASC }─▶─┤
			#                                                          └─▶{ DESC }──┘
			#
			# Simplified grammar:
			#   name [COLLATE identifier] [ASC | DESC]
			#
			# Relevant SQLite documentation:
			#   - https://www.sqlite.org/syntax/indexed-column.html
			#
			# The eidlist non-terminal (Expression Id List) generates an ExprList
			# from a list of identifiers.  The identifier names are in ExprList.a[].zName.
			# This list is stored in an ExprList rather than an IdList so that it
			# can be easily sent to sqlite3ColumnsExprList().
			#
			# IMPORTANT COMPATIBILITY NOTE:  Some prior versions of SQLite accepted
			# COLLATE clauses and ASC or DESC keywords on ID lists in inappropriate
			# places - places that might have been stored in the sqlite_schema table.
			# Those extra features were ignored.  But because they might be in some
			# (busted) old databases, we need to continue parsing them when loading
			# historical schemas.
			#
			column_name  = name(except: [:COLLATE, :ASC, :DESC].freeze)
			if (collate_kw = maybe :COLLATE)
				collation_tk = identifier_or_string(except: [:ASC, :DESC].freeze)
			end
			direction_tk = maybe_one_of :ASC, :DESC

			IndexedColumn.concrete(
				full_source: @lexer.sql,
				name_tk:      Token::Identifier(column_name),
				collate_kw:   Token::Keyword(collate_kw),
				collation_tk: Token::Keyword(collation_tk),
				direction_tk: Token::Keyword(direction_tk)
			)
		end

		def indexed_expression
			# Used by:
			#   - tcons, upsert, expr (ORDER BY), create-index, window
			#
			# Relevant `parse.y` grammar rules:
			#   sortlist  ::= sortlist COMMA expr sortorder nulls | expr sortorder nulls
			#   sortorder ::= . | ASC | DESC
			#   nulls     ::= . | NULLS FIRST | NULLS LAST
			#
			# Syntax diagram:
			#   ◯─▶[ expr ]─┬────────▶───┬─┬────────────▶────────────┬───▶◯
			#               ├─▶{ ASC }─▶─┤ ├─▶{ NULLS }─▶{ FIRST }─▶─┤
			#               └─▶{ DESC }──┘ └─▶{ NULLS }─▶{ LAST }────┘
			#
			# Simplified grammar:
			#   expression [ASC | DESC] [NULLS FIRST | NULLS LAST]
			#
			# Relevant SQLite documentation:
			#   - https://www.sqlite.org/syntax/indexed-column.html
			#   - https://www.sqlite.org/expridx.html
			#
			# the sortlist non-terminal stores a list of expression where each
			# expression is optionally followed by ASC or DESC to indicate the
			# sort order.
			#
			expr         = expression
			direction_tk = maybe_one_of :ASC, :DESC
			nulls_tk     = maybe_one_of [:NULLS, :FIRST].freeze, [:NULLS, :LAST].freeze

			IndexedExpression.new(
				expression: expr,
				direction_tk: Token::Keyword(direction_tk),
				nulls_tk: Token::Keyword(nulls_tk)
			)
		end

		def ordering_term
			#
				# Relevant `parse.y` grammar rules:
				#   sortlist ::= sortlist COMMA expr sortorder nulls |
				#                expr sortorder nulls
				#   sortorder ::= ASC | DESC | .
				#   nulls ::= NULLS FIRST | NULLS LAST | .
				#   eidlist ::= eidlist COMMA nm collate sortorder |
				#               nm collate sortorder
				#   collate ::= . |
				#               COLLATE ids.
				#
				# Syntax diagram:
				#   ◯─▶[ expr ]┬───────────────▶────────────────┬▶┬──────▶─────┬▶┬──────────▶─────────────┬─▶◯
				#              └▶{ COLLATE }─▶{ collation-name }┘ ├▶{ ASC }──▶─┤ ├▶{ NULLS }─▶{ FIRST }─▶─┤
				#                                                 └▶{ DESC }─▶─┘ └▶{ NULLS }─▶{ LAST }──▶─┘
				#
				# Simplified grammar:
				#
				# Relevant SQLite documentation:
				#   -
				#
				# [description]
			#
			e = expression
			if (collate_kw = maybe(:COLLATE))
				collation = identifier
			end
			if current_token in :ASC | :DESC
				direction = require current_token
			end
			if (nulls_kw = maybe(:NULLS))
				nulls = require current_token
			end

			OrderingTerm.concrete(
				full_source: @lexer.sql,
				expression: e,
				collate_kw: Token::Keyword(collate_kw),
				collation_tk: Token::Identifier(collation),
				direction_tk: Token::Keyword(direction),
				nulls_kw: Token::Keyword(nulls_kw),
				nulls_tk: Token::Keyword(nulls),
			)
		end

		def signed_number
			#
				# Used by:
				#   - pragma_value
				#   - type_name
				#
				# Relevant `parse.y` grammar rules:
				#   signed ::= plus_num | minus_num
				#   plus_num ::= PLUS number | number
				#   minus_num ::= MINUS number
				#   number ::= INTEGER | FLOAT
				#
				# Syntax diagram:
				#   ◯─┬───▶────┬─▶{ numeric-literal }─▶◯
				#     ├─▶{ + }─┤
				#     └─▶{ - }─┘
				#
				# Simplified grammar:
				#   [PLUS | MINUS] INTEGER | FLOAT
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/signed-number.html
				#
				# A signed number is a numeric literal with an optional sign.
			#
			sign_tk  = maybe_one_of   :PLUS, :MINUS
			value_tk = require_one_of :INTEGER, :FLOAT

			return value_tk unless sign_tk

			sign_tk, beg, _fin = sign_tk
			value_tk, _beg, fin = value_tk

			[[sign_tk, value_tk], beg, fin]
		end

		def signed_numeric
			#
				# Used by:
				#   - column_constraint
				#
				# Relevant `parse.y` grammar rules:
				#   ccons ::= DEFAULT PLUS term | DEFAULT MINUS term
				#   expr ::= expr PLUS|MINUS expr | term
				#   term ::= NULL | FLOAT | BLOB | STRING | INTEGER | CTIME_KW | QNUMBER
				#
				# Syntax diagram:
				#   ◯─┬───▶────┬─▶{ numeric-literal }─▶◯
				#     ├─▶{ + }─┤
				#     └─▶{ - }─┘
				#
				# Simplified grammar:
				#   [PLUS | MINUS] INTEGER | FLOAT | QNUMBER
				#
				# Relevant SQLite documentation:
				#   - https://www.sqlite.org/syntax/signed-number.html
				#
				# A signed number is a numeric literal with an optional sign.
			#
			sign_tk  = maybe_one_of   :PLUS, :MINUS
			value_tk = require_one_of :INTEGER, :FLOAT, :QNUMBER

			return value_tk unless sign_tk

			sign_tk, beg, _fin = sign_tk
			value_tk, _beg, fin = value_tk

			[[sign_tk, value_tk], beg, fin]
		end

		# ---------- Token Classes ----------


		def name(except: [])
			# Relevant `parse.y` grammar rules:
			#   // The name of a column or table can be any of the following:
			#   nm ::= idj | STRING
			#
			if current_token in :STRING
				require current_token
			elsif (idj = maybe { identifier_or_join_keyword(except: except) })
				idj
			else
				expected!(:STRING, 'idj')
			end
		end

		def identifier(except: [])
			# Relevant `parse.y` grammar rules:
			#   // An IDENTIFIER can be a generic identifier, or one of several
			#   // keywords.  Any non-standard keyword can also be an identifier.
			#   %token_class id  ID | INDEXED
			#
			if current_token in :ID | :INDEXED
				require current_token
			elsif !except.include?(current_token) && TOKEN_FALLBACKS.include?(current_token)
				require current_token
			else
				expected!(:ID, :INDEXED, 'fallback')
			end
		end

		def identifier_or_string(except: [])
			# Relevant `parse.y` grammar rules:
			#   // And "ids" is an identifer-or-string.
			#   %token_class ids  ID | STRING
			#
			if current_token in :ID | :STRING
				require current_token
			elsif !except.include?(current_token) && TOKEN_FALLBACKS.include?(current_token)
				require current_token
			else
				expected!(:ID, :STRING, 'fallback')
			end
		end

		def identifier_or_join_keyword(except: [])
			# Relevant `parse.y` grammar rules:
			#   // An identifier or a join-keyword
			#   %token_class idj  ID | INDEXED | JOIN_KW
			#
			if current_token in :ID | :INDEXED | :CROSS | :FULL | :INNER | :LEFT | :NATURAL | :OUTER | :RIGHT
				require current_token
			elsif !except.include?(current_token) && TOKEN_FALLBACKS.include?(current_token)
				require current_token
			else
				expected!(:ID, :INDEXED, :JOIN_KW, 'fallback')
			end
		end

		private

		# ---------- Parsing Helpers ----------

		def require(token)
			if token == current_token
				advance
			else
				expected!(token)
			end
		end

		def maybe(token = nil) # &block
			if block_given?
				start_buffer = @peek_buffer.dup
				start_lexer_cursor = @lexer.cursor
				start_lexer_pos = @lexer.anchor

				result = catch(:ERROR) { yield }

				if ErrorMessage === result
					@peek_buffer = start_buffer
					@lexer.cursor = start_lexer_cursor
					@lexer.anchor = start_lexer_pos
					nil
				else
					result
				end
			elsif token == current_token
				advance
			end
		end

		def scan(&block)
			ensure_buffer
			beg = @lexer.anchor
			ret = block.call
			ensure_buffer
			fin = (@lexer.cursor == @lexer.anchor+1) ? @lexer.anchor : @lexer.anchor-1
			[[], beg, fin]
		end

		def require_all_of(*tokens)
			i, len = 0, tokens.length
			start_pos, end_pos = nil
			while i < len
				if tokens[i] == current_token
					_tok, beg, fin = advance
					start_pos = beg if i == 0 # first iteration
					end_pos = fin if i == (len - 1) # last iteration

					i += 1
				else
					# TODO: only show the tokens from `i` onwards
					expected!(tokens)
				end
			end

			[tokens, start_pos, end_pos].freeze
		end

		def maybe_all_of(*tokens)
			advancing = true
			i, len = 0, tokens.length
			buf = ensure_buffer(len)
			while i < len
				tok, * = buf[i]
				if tokens[i] != tok
					advancing = false
					break
				end
				i += 1
			end

			require_all_of(*tokens) if advancing
		end

		def maybe_one_of(*tokens)
			i, len = 0, tokens.length
			has_nil = false
			while i < len
				check = tokens[i]
				if Symbol === check && (result = maybe check)
					return result
				elsif Array === check && (result = maybe_all_of *check)
					return result
				elsif check.nil?
					has_nil = true
					i += 1
				else
					i += 1
				end
			end

			has_nil ? false : nil
		end

		def require_one_of(*tokens)
			maybe_one_of(*tokens) || expected!(*tokens)
		end

		def require_some(trailing_sep: nil, leading_sep: nil, given: nil, &block)
			a = []

			if leading_sep
				sep_tk = Array === leading_sep ? require_one_of(*leading_sep) : require(leading_sep)
				val = yield(sep_tk)
				insert = if Node === val
				  val.leading = Token::Punctuation(sep_tk)
					val
				else
					[sep_tk, val]
				end
			elsif trailing_sep
				val = (given || yield)
				sep_tk = Array === trailing_sep ? maybe_one_of(*trailing_sep) : maybe(trailing_sep)
				insert = if Node === val
				  val.trailing = Token::Punctuation(sep_tk) if sep_tk
					val
				else
					[val, sep_tk]
				end
			else
				val = (given || yield)
				insert = val
			end
			a << insert

			collect(into: a, trailing_sep: trailing_sep, leading_sep: leading_sep, &block)

			return token_span_from(*a) if a.all?(Array)

			a
		end

		def maybe_some(trailing_sep: nil, leading_sep: nil, &block)
			a = []

			if leading_sep
				sep_tk = Array === leading_sep ? maybe_one_of(*leading_sep) : maybe(leading_sep)
				return if sep_tk.nil?

				val = yield(sep_tk)
				insert = if Node === val
				  val.leading = Token::Punctuation(sep_tk)
					val
				else
					[sep_tk, val]
				end
			elsif trailing_sep
				val = maybe { yield }
				return a if val.nil?

				sep_tk = Array === trailing_sep ? maybe_one_of(*trailing_sep) : maybe(trailing_sep)
				insert = if Node === val
				  val.trailing = Token::Punctuation(sep_tk) if sep_tk
					val
				else
					[val, sep_tk]
				end
			else
				insert = maybe { yield }
			end

			if insert
				a << insert

				collect(into: a, trailing_sep: trailing_sep, leading_sep: leading_sep, &block)

				return token_span_from(*a) if a.all?(Array)

				a
			else
				a
			end
		end

		def collect(into: [], trailing_sep: nil, leading_sep: nil, &block)
			break_next = false
			while true
				break if break_next

				if leading_sep
					sep_tk = Array === leading_sep ? maybe_one_of(*leading_sep) : maybe(leading_sep)
					break if sep_tk.nil?

					val = yield(sep_tk)

					insert = if Node === val
					  val.leading = Token::Punctuation(sep_tk)
						val
					else
						[sep_tk, val]
					end

				elsif trailing_sep
					val = maybe { yield }
					break if val.nil?

					sep_tk = Array === trailing_sep ? maybe_one_of(*trailing_sep) : maybe(trailing_sep)
					break_next = sep_tk.nil?

					insert = if Node === val
					  val.trailing = Token::Punctuation(sep_tk) if sep_tk
						val
					else
						[val, sep_tk]
					end

				else
					val = maybe { yield }
					break if val.nil?

					insert = val
				end

				into << insert
			end

			into
		end

		def token_span_from(*spans)
			spans.compact!
			i, len = 0, spans.length
			start_pos, end_pos = nil
			tokens = []
			while i < len
				tok, beg, fin = spans[i]
				Array === tok ? (tokens.concat(tok)) : (tokens << tok)
				start_pos = beg if i == 0 # first iteration
				end_pos = fin if i == (len - 1) # last iteration

				i += 1
			end

			[tokens, start_pos, end_pos]
		end

		# Access the current token type in the lexer stream.
		# Reads but doesn't consume the token at the head of the buffer.
		def current_token
			buf = ensure_buffer
			buf[0][0]
		end

		# Access the string value for the current token.
		# Reads but doesn't consume the start_pos and end_pos values at the head of the buffer.
		def current_value
			buf = ensure_buffer
			sql = @lexer.sql
			_tk, beg, fin = buf[0]

			sql.byteslice(beg, (fin - beg))
		end

		# Peek at the next `n` tokens in the lexer stream.
		# Does not advance the lexer cursor and does not consider the current token.
		def peek(n = 1)
			buf = ensure_buffer(n + 1)
			return buf[1][0] if n == 1 # symbol element of the 2nd token

			[].tap do |a|
				i, len = 1, buf.length
				while i <= n
					tok, * = buf[i]
					a << tok
					i += 1
				end
			end
		end

		# Advance the implicit cursor pointing to the first token in the buffer by `n` tokens.
		# Returns the new token at the head of the buffer.
		def advance
			ensure_buffer
			@peek_buffer.shift
		end

		# Ensure that the `@peek_buffer` has at least `size` tokens.
		# Note: the buffer is a nested array of `[token, start_pos, end_pos]` triples
		def ensure_buffer(size = 1)
			lexer = @lexer
			@peek_buffer.tap do |buf|
				while buf.size < size
					buf << [lexer.next_token, lexer.anchor, lexer.cursor].freeze
				end
			end
		end

		def expected!(*expected)
			error!(current_token, current_value, expected)
		end

		def error!(token, value, expected)
			# TODO: we should handle multi-line sql highlighting
			highlight = (" " * @lexer.anchor) + ("^" * (@lexer.cursor - @lexer.anchor))
			msg = "Unexpected token #{token}[#{value.inspect}] at:\n  #{@lexer.sql.strip}\n  #{highlight}\n  Expected one of: #{expected.join(", ")}\n"

			throw :ERROR, ErrorMessage.new(msg)
		end
	end
end