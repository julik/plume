SELECT *
    FROM t44 AS x
       LEFT JOIN (SELECT a AS c, b AS d FROM t44) AS y ON a=c
   WHERE d=4 OR d IS NULL;
