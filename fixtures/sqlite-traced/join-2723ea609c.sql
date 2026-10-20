SELECT *, 'x'
    FROM t1 LEFT JOIN t2
   WHERE a IN (1,3,x,y);
