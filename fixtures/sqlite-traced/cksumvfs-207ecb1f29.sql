WITH s(i) AS (
    VALUES(1) UNION ALL SELECT i+1 FROM s WHERE i<100
  )
  INSERT INTO t1 SELECT NULL, randomblob(5000), randomblob(i) FROM s;
