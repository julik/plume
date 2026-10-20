SELECT string_agg(a, ',' ORDER BY b DESC, d) FROM t1;
