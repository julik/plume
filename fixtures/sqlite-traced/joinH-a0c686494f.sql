SELECT t0.c2,
         (t0.c2 IS (SELECT count(*) FROM t0 AS x WHERE x.c0 = v0.c0)) AS p
  FROM v0 RIGHT JOIN t0 ON t0.c0;
