SELECT * FROM t1 WHERE nth_value(x, 1) OVER (ORDER BY y);
