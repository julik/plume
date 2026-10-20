SELECT min(c) OVER win, max(c) OVER win, sum(c) OVER win FROM t3
    WINDOW win AS (
      ORDER BY c, b, a
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  EXCLUDE CURRENT ROW 
    ) ORDER BY a, b, c;
