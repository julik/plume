SELECT 
      t1.a, 
      (t1.a IN (SELECT t3.c FROM t3)), 
      t1.a
  FROM t1 
  GROUP BY t1.a
