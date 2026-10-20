SELECT b, max(a) FILTER (WHERE b='x') FROM t1;
