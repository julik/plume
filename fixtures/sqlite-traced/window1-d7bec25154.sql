SELECT c, sum(d) OVER win2 FROM t1
      WINDOW win1 AS (ORDER BY b),
             win2 AS (win1 ORDER BY d)
