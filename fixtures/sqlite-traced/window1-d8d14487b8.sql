SELECT count(*) FROM t1 GROUP BY y HAVING nth_value(x, 1) OVER (ORDER BY y);
