SELECT a, t1.a, t2.a, t3.a, t4.a, t5.a
  FROM t1 RIGHT JOIN (
  t2 RIGHT JOIN (
  t3 INNER JOIN (
  t4 INNER JOIN t5 USING(a)
  ) USING(a)
  ) USING(a)
  ) USING(a)
  ORDER BY 1 NULLS FIRST;
