SELECT DISTINCT a, b
    FROM t0 JOIN t1 ON z=a RIGHT JOIN t2 ON a=b LEFT JOIN v5 ON false
   WHERE x <= y;
