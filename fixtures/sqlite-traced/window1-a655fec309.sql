SELECT c, sum(d) OVER (win4 ORDER BY b) FROM t1
      WINDOW win1 AS ()
