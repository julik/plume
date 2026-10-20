WITH s(i) AS ( SELECT 0 UNION ALL SELECT i+1 FROM s WHERE i<$nrow )
  INSERT INTO t1(a, b) SELECT i+1, char((i % 26) + 65) FROM s;
