SELECT x, count(*) OVER (ORDER BY x) FROM t1;
