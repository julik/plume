SELECT a, c, max(b) FILTER (WHERE c='x') FROM t2 GROUP BY a;
