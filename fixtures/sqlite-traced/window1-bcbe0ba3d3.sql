SELECT a, sum(a) OVER (ORDER BY a) FROM t2;
