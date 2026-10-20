SELECT * FROM t1
   WHERE a=1
     AND b IN (2,3)
     AND c BETWEEN 4 AND 5
   ORDER BY +id;
