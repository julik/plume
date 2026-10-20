SELECT * FROM t1 WHERE (a, b) IN (SELECT min(x), 'one' FROM t2)
