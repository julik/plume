SELECT t1.a1, t2.d2
    FROM (t1 LEFT JOIN t3 ON t3.e3=t1.b1) JOIN t2 ON t2.c2=t1.a1
   WHERE t1.a1=33
   ORDER BY t2.d2 DESC;
