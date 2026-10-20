SELECT (SELECT group_concat(a,d ORDER BY d) FROM t3) FROM t1;
