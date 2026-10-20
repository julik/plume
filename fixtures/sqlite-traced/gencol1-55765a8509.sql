SELECT * FROM t0 AS x JOIN t0 AS y
   WHERE x.b='2'
     AND (y.a=2 OR (x.b LIKE '2*' AND y.a=x.b));
