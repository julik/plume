SELECT c, sum(d) OVER win2 FROM t1
      WINDOW win1 AS (ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 
             win2 AS (win1 ORDER BY b)
