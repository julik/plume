-- output verify using PG 14.2
  SELECT *
    FROM t1 CROSS JOIN t2 FULL JOIN t3 ON a=d
   ORDER BY +d, +column1;
