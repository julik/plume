SELECT
    count(*) OVER (),
    (SELECT count(*) FROM t1 FULL JOIN t2 ON t3.c)
  FROM t3;
