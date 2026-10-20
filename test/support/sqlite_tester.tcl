# A stand-in for test/tester.tcl from SQLite's own suite, used by bin/trace-fixtures. It runs a test
# file against the real sqlite3 Tcl package and records every SQL string the file hands to SQLite.
# Expected results are ignored.
package require sqlite3

set ::TRACE [open $::env(TRACE_OUT) w]
fconfigure $::TRACE -encoding utf-8 -translation lf

proc trace_sql {kind sql} {
	puts $::TRACE "#### $kind [string length $sql]"
	puts $::TRACE $sql
}

rename sqlite3 sqlite3_real
proc sqlite3 {name args} {
	if {[llength $args] == 0} { return [sqlite3_real $name] }
	if {[info commands ::${name}_real] ne ""} { catch {::${name}_real close}; rename ::${name}_real "" }
	if {[info commands ::$name] ne ""} { rename ::$name "" }
	sqlite3_real $name {*}$args
	rename ::$name ::${name}_real
	proc ::$name {cmd args} "wrapped_db [list $name] \$cmd {*}\$args"
}
proc wrapped_db {name cmd args} {
	switch -- $cmd {
		eval - one - exists - onecolumn { trace_sql exec [lindex $args 0] }
		complete { trace_sql complete [lindex $args 0] }
	}
	uplevel 2 [list ::${name}_real $cmd {*}$args]
}

proc execsql {sql {db db}} { uplevel 1 [list $db eval $sql] }
proc catchsql {sql {db db}} {
	set rc [catch {uplevel 1 [list $db eval $sql]} msg]
	list $rc $msg
}
proc do_test {name cmd {expected ""}} { catch {uplevel 1 $cmd} }
proc do_execsql_test {name sql {expected ""}} { catch {uplevel 1 [list execsql $sql]} }
proc do_catchsql_test {name sql {expected ""}} { catch {uplevel 1 [list catchsql $sql]} }
proc ifcapable {expr code {else ""} {elsecode ""}} { uplevel 1 $code }
proc finish_test {} {}
proc forcedelete {args} { foreach f $args { catch {file delete -force $f} } }
proc reset_db {} {
	catch {db close}
	forcedelete test.db
	sqlite3 db test.db
}
proc load_static_extension {args} {}
proc sqlite3_connection_pointer {db} { return $db }
proc sqlite3_prepare {db sql args} { trace_sql exec $sql; prepared_tail $args }
proc sqlite3_prepare_v2 {db sql args} { trace_sql exec $sql; prepared_tail $args }
proc sqlite3_prepare_v3 {db sql args} { trace_sql exec $sql; prepared_tail $args }
proc prepared_tail {args} {
	set var [lindex [lindex $args 0] end]
	if {$var ne "" && ![string is integer $var]} { upvar 2 $var tail; set tail "" }
	return STMT
}
proc sqlite3_normalize {sql} { trace_sql exec $sql }
proc sqlite3_complete {sql} { trace_sql complete $sql; sqlite3_real complete $sql }

# Anything else the real harness provides is a no-op here
proc unknown {args} { return "" }

set ::testprefix ""
cd [file normalize $::env(TRACE_DIR)]
forcedelete test.db
sqlite3 db test.db
set ::DB db
