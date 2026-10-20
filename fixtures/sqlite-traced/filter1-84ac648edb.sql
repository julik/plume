SELECT max(a), max(a) FILTER (WHERE b<12345), b FROM t1;
