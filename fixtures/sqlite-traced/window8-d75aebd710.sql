SELECT max(c) OVER win,
             min(c) OVER win,
             count(a) OVER win
      FROM t3
      WINDOW win AS (  ORDER BY a NULLS LAST GROUPS 6 PRECEDING   EXCLUDE GROUP  )
      ORDER BY 1 NULLS FIRST, 2 NULLS FIRST, 3 NULLS FIRST
