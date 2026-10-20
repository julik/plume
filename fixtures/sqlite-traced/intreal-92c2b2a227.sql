SELECT *
    FROM t1 RIGHT JOIN (SELECT if(1,b) AS v FROM t1) s ON v GLOB '0.0'
   WHERE t1.c='x';
