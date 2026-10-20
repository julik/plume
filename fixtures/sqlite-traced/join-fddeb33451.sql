SELECT t1.id, x2.id, x3.id
  FROM t1
  LEFT JOIN (SELECT * FROM t2) AS x2 ON t1.id=x2.c2
  LEFT JOIN t3 AS x3 ON x2.id=x3.c3;
