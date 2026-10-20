SELECT count(*) 
    FROM (SELECT 99 as "m" FROM t2 JOIN v0 ON z<>'' RIGHT JOIN t1 ON z<>'' ORDER BY z) AS "t3";
