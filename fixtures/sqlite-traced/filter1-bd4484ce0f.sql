SELECT sum(a) FILTER (WHERE 1 - max(a) OVER () > 0) FROM t1
