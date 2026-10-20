EXPLAIN QUERY PLAN
  SELECT t1.z, agg2.m
    FROM t1 JOIN agg2 ON t1.y=agg2.m
   WHERE t1.x IN (1,2,3);
