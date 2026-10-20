SELECT * FROM dual CROSS JOIN (SELECT CAST(44 AS REAL) AS 'm'
                                 UNION ALL SELECT 55);
