SELECT a, lead(b, 3, 'abc') OVER (ORDER BY a) FROM t4
