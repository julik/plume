-- other constant functions are optimized out
  EXPLAIN SELECT * FROM x1, x2 WHERE x=1 ORDER BY abs(5);
