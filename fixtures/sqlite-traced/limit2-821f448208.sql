SELECT *
    FROM t1 LEFT JOIN t2 ON t1.aa=t2.aa
   WHERE t1.bb='meal'
   ORDER BY t2.dd DESC
   LIMIT 1;
