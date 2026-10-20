SELECT *
    FROM t1 JOIN t2 USING(id)
   WHERE t1.a=777 AND t2.id>999
   ORDER BY t1.id;
