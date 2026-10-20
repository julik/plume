EXPLAIN QUERY PLAN
  SELECT t4.x
    FROM tab AS t0, tab AS t1, tab AS t2, tab AS t3, tab AS t4
   WHERE t0.id=0
     AND t1.id BETWEEN t0.minChild AND t0.maxChild
     AND t2.id BETWEEN t1.minChild AND t1.maxChild
     AND t3.id BETWEEN t2.minChild AND t2.maxChild
     AND t4.id BETWEEN t3.minChild AND t3.maxChild
  ORDER BY t4.x;
