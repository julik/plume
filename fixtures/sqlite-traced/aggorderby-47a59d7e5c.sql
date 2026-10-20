SELECT (SELECT string_agg(a,'#' ORDER BY d) FROM t3) FROM t1;
