SELECT c, sum(d) OVER (win1 PARTITION BY d) FROM t1
      WINDOW win1 AS ()
