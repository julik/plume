SELECT (
    SELECT count( ( SELECT(sum(0) OVER(ORDER BY c, abs(a))) ) )
      FROM t2 GROUP BY c LIMIT 1
  ) 
  FROM t1;
