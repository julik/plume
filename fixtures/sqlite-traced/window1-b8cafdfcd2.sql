SELECT id, b, lead(c,1) OVER(ORDER BY c) AS x 
    FROM t1 WHERE id>1
   ORDER BY b LIMIT 1;
