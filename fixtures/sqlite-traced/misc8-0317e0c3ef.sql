SELECT *
    FROM
         (
           (SELECT 0 AS i) AS x1,
           (SELECT 1) AS x2
         ) AS x3,
         (SELECT 6 AS j UNION ALL SELECT 7) AS x4
   WHERE i<rowid
   ORDER BY 1;
