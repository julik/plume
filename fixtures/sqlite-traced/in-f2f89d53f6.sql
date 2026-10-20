SELECT a0.a, group_concat(a1.a) AS b
    FROM t4 AS a0 JOIN t4 AS a1
   GROUP BY a0.a
  HAVING (SELECT sum( (a1.a == +a0.a COLLATE NOCASE) IN (SELECT b FROM t4)));
