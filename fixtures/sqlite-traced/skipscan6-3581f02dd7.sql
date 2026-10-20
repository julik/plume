WITH d(a, b) AS (
    SELECT 1, 1 
    UNION ALL
    SELECT a+1, (a+1) % 5 FROM d WHERE a<100
  )
  INSERT INTO t3 SELECT a, b, 'c', 'd' FROM d;
