SELECT sum(a) FILTER (WHERE 1 - count(a)) FROM t1
