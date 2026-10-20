SELECT rowid, a, b, sum(a)OVER() FROM t1 ORDER BY count(b);
