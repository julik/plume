SELECT(
    SELECT max(b) LIMIT (
      SELECT total( (SELECT a FROM t1) )
    )
  )
  FROM t2;
