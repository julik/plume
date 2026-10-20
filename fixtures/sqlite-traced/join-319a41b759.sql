SELECT *, 'x' 
    FROM t1 LEFT JOIN t2 
   WHERE t2.y IS NOT 'abc'
