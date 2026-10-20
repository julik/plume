EXPLAIN QUERY PLAN
  SELECT *
    FROM t1, t2 CROSS JOIN t3, t4
   WHERE t4.g=1
     AND t1.a=t4.h
     AND t2.c=t1.b
     AND t3.e=t2.d;
