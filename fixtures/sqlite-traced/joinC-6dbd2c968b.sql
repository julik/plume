SELECT a, t1.a, t2.a, t3.a, t4.a, t5.a
  FROM t1 LEFT JOIN (
  t2 FULL JOIN (
  t3 RIGHT JOIN (
  t4 FULL JOIN t5 USING(a)
  ) USING(a)
  ) USING(a)
  ) USING(a)
  ORDER BY 1 NULLS FIRST;
