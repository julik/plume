EXPLAIN QUERY PLAN 
    SELECT b.* FROM t1 a, t1 b
     WHERE a.w=1 AND (b.z=10 OR a.y=b.z OR b.z=10)
     ORDER BY +b.w
