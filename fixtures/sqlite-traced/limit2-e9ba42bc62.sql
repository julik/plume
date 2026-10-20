SELECT a, b, '|' FROM t2, t1 WHERE t2.x='a' AND t1.a=t2.y ORDER BY t1.b LIMIT 5;
