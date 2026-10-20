SELECT a, lead(b, 2) OVER (ORDER BY a) FROM t4
