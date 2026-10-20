SELECT * FROM t1 GROUP BY t1.a
     HAVING 
             (t1.a IN (SELECT t3.c FROM t3)) 
         AND (t1.a IN (SELECT t2.b FROM t2))
