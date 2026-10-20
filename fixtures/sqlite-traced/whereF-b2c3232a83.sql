EXPLAIN QUERY PLAN SELECT t1.a, t1.b, t2.d, t2.e FROM t2 CROSS JOIN t1 
     WHERE t2.d=t1.b AND t1.a=(t2.d+1) AND t1.b = (t2.e+1)
