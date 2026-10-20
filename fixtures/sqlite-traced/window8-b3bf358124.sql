SELECT max(c) OVER win,
             min(c) OVER win,
             count(a) OVER win
      FROM t3
      WINDOW win AS (  PARTITION BY coalesce(a, '') 
        RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING   EXCLUDE NO OTHERS  )
      ORDER BY 1 NULLS FIRST, 2 NULLS FIRST, 3 NULLS FIRST
