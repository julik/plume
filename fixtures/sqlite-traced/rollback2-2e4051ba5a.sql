WITH data(a, b) AS (
    SELECT 1, int2hex(1)
      UNION ALL
    SELECT a+1, int2hex(a+1) FROM data WHERE a<40
  )
  INSERT INTO t1 SELECT * FROM data;
