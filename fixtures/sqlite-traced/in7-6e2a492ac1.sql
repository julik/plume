SELECT * FROM t1 WHERE (a, b) IN (SELECT count(*), 'three' FROM t2)
