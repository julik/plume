SELECT count((SELECT count(a0.a+a0.b) ORDER BY sum(0) OVER (PARTITION BY 0)))
    FROM t1 AS a0 JOIN t1 AS a1
   GROUP BY a1.a;
