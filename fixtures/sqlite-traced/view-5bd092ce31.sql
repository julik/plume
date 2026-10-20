-- Two queries get the same result even though the order of terms
  -- in the CTE is reversed
  WITH c(x) AS ( SELECT b FROM x2 UNION SELECT 123 )
    SELECT count(*) FROM x1 WHERE a IN c;
