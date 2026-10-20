SELECT string_agg(c, '.') OVER win2
  FROM t1
  WINDOW win1 AS (PARTITION BY b),
         win2 AS (win1 ORDER BY c)
