SELECT c, sum(d) OVER win2 FROM t1
      WINDOW win1 AS (),
             win2 AS (win4 ORDER BY b)
