EXPLAIN QUERY PLAN 
      SELECT * FROM t1 WHERE z=10006 AND y IN (10000,10201)
                       AND x>0 AND x<10
      ORDER BY w
