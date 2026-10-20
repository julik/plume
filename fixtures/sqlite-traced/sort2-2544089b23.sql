WITH r(x,y) AS (
      SELECT 1, randomblob(100)
      UNION ALL
      SELECT x+1, randomblob(100) FROM r
      LIMIT 10000
    ) INSERT INTO t1 SELECT * FROM r;
