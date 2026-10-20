SELECT (
    SELECT count( a ) FROM t2 LIMIT 1
  )
  FROM t1;
