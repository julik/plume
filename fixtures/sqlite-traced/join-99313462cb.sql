SELECT *
    FROM empty RIGHT JOIN t0 ON true
   WHERE (a,b) IN (SELECT a,b FROM t0)
   ORDER BY +b;
