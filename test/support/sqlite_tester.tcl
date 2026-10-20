# A stand-in for test/tester.tcl from SQLite's own suite, used by bin/trace-fixtures. It runs a test
# file against the real sqlite3 Tcl package and records every SQL string the file hands to SQLite.
# Expected results are ignored.
package require sqlite3

set ::TRACE [open $::env(TRACE_OUT) w]
fconfigure $::TRACE -encoding utf-8 -translation lf

# A header with the length in bytes, so SQL holding newlines comes back out whole
proc trace_sql {sql} {
	puts $::TRACE "#### [string length [encoding convertto utf-8 $sql]]"
	puts $::TRACE $sql
}

# Each handle `name` is wrapped by a proc that traces the SQL and calls the real handle, `name_real`
rename sqlite3 sqlite3_real
proc sqlite3 {name args} {
	if {[llength $args] == 0} { return [sqlite3_real $name] }
	catch {::${name}_real close}
	catch {rename ::$name ""}
	sqlite3_real $name {*}$args
	rename ::$name ::${name}_real
	proc ::$name {cmd args} "wrapped_db [list $name] \$cmd {*}\$args"
}
proc wrapped_db {name cmd args} {
	if {$cmd in {eval one exists onecolumn complete}} { trace_sql [lindex $args 0] }
	uplevel 2 [list ::${name}_real $cmd {*}$args]
}

proc execsql {sql {db db}} { uplevel 1 [list $db eval $sql] }
proc catchsql {sql {db db}} {
	set rc [catch {uplevel 1 [list $db eval $sql]} msg]
	list $rc $msg
}
proc do_test {name cmd {expected ""}} { catch {uplevel 1 $cmd} }
# `do_execsql_test ?-db DB? NAME SQL ?RESULT?`, and the same for do_catchsql_test
proc do_execsql_test {args} { catch {uplevel 1 [sql_test_call execsql {*}$args]} }
proc do_catchsql_test {args} { catch {uplevel 1 [sql_test_call catchsql {*}$args]} }
proc sql_test_call {command args} {
	set db db
	if {[lindex $args 0] eq "-db"} { set db [lindex $args 1]; set args [lrange $args 2 end] }
	list $command [lindex $args 1] $db
}
# Every capability counts as compiled in, so `!name` is false and an else branch runs only then
proc ifcapable {expr code {else ""} {elsecode ""}} {
	regsub -all {[A-Za-z_][A-Za-z_0-9]*} $expr 1 truth
	if {[expr $truth]} { uplevel 1 $code } else { uplevel 1 $elsecode }
}
proc forcedelete {args} { foreach f $args { catch {file delete -force $f} } }
proc reset_db {} {
	catch {db close}
	forcedelete test.db
	sqlite3 db test.db
}
proc sqlite3_connection_pointer {db} { return $db }
proc sqlite3_normalize {sql} { trace_sql $sql }
proc sqlite3_complete {sql} { db complete $sql }
# `sqlite3_prepare_v3 DB SQL N FLAGS TAILVAR`: the tail variable, when given, comes last
foreach prepare {sqlite3_prepare sqlite3_prepare_v2 sqlite3_prepare_v3} {
	proc $prepare {db sql args} {
		trace_sql $sql
		set var [lindex $args end]
		if {$var ne "" && ![string is integer $var]} { upvar 1 $var tail; set tail "" }
		return STMT
	}
}

# Anything else the real harness provides (finish_test, load_static_extension...) is a no-op here
proc unknown {args} { return "" }

set ::testprefix ""
cd [file normalize $::env(TRACE_DIR)]
forcedelete test.db
sqlite3 db test.db
set ::DB db
