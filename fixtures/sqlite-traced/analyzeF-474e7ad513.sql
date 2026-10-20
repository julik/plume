WITH data(i) AS (
    SELECT 1 UNION ALL SELECT i+1 FROM data
  )
  INSERT INTO t1 SELECT isqrt(i), isqrt(i) FROM data LIMIT 400;
