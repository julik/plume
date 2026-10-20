SELECT
    count(*) OVER (),
    (SELECT count(*) FROM t1 JOIN t2 ON t3.c RIGHT JOIN t4 ON 1)
  FROM t3;
