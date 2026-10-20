SELECT t0_2.c
    FROM (SELECT '0000' AS c0 FROM empty2 RIGHT JOIN t0_1 ON 1) AS v0 
    LEFT JOIN empty1 ON v0.c0, t0_2 
    RIGHT JOIN (
           SELECT 5678 AS col0 FROM (SELECT 0)
    ) AS sub1 ON 1 WHERE +t0_2.c;
