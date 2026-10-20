-- output verified using PG 14.2
  SELECT *
    FROM t1 CROSS JOIN t2 FULL JOIN t3 ON a=d
   WHERE column1 IS NULL;
