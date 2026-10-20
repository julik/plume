SELECT t0.c1 FROM t0 GROUP BY t0.c1
     HAVING 
             (t0.c1 IN (SELECT t0.c1 FROM t0)) 
     AND NOT (t0.c1 IN (SELECT t0.c0 FROM t0))
