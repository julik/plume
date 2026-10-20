-- Lots of rows of (1, 'no'), followed by a single (1, 'yes').
  WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<100)
    INSERT INTO t1(a, b) SELECT 1, 'no' FROM c;
