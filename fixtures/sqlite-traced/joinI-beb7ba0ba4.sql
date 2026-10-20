SELECT *
  FROM t1 JOIN t0 ON (t0.a >= 3 OR t0.a <= 0)
  RIGHT JOIN t2 ON 1
  WHERE t1.b IS NULL;
