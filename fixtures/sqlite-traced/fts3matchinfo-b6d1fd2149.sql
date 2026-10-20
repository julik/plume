SELECT docId, t10.*
    FROM t10
    JOIN (SELECT 1 AS idx UNION SELECT 2 UNION SELECT 3) AS x
   WHERE t10 MATCH x.idx
     AND matchinfo(t10) not null
   GROUP BY docId
   ORDER BY 1;
