SELECT a, sum(b) FROM t3 GROUP BY a HAVING nondeter(a)
