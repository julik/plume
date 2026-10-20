SELECT
    count(*) OVER (),
    (SELECT count(*) FROM t1 RIGHT JOIN t2 ON t3.c)
  FROM t3;
