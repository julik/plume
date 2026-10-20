SELECT c, sum(d) OVER (win1 ORDER BY d) FROM t1
      WINDOW win1 AS (ORDER BY b)
