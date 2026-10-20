SELECT (
    SELECT count( a+c ) FROM t2 LIMIT 1
  )
  FROM t1;
