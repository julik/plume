WITH t99(b) AS (
    SELECT coalesce(b,3) FROM t2 AS x LEFT JOIN t1 ON c IN (SELECT x FROM t3)
  )
  SELECT d, e, b FROM t2 JOIN t99 ON b IN (1,2,3) ORDER BY +d;
