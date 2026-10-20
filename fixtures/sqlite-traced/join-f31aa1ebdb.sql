SELECT *, 'x' 
    FROM t1 LEFT JOIN t2 
   WHERE ~ ( 'x'='y' AND t2.y=1 );
