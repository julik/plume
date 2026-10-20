SELECT max(~likely(x)) FILTER (WHERE true) FROM t1 INDEXED BY t1x GROUP BY x;
