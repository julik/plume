SELECT sum(c) FILTER (WHERE (c%2)!=0) OVER win,
             rank() OVER win,
             dense_rank() OVER win
      FROM t3
      WINDOW win AS (  ORDER BY a NULLS FIRST GROUPS 6 PRECEDING   EXCLUDE NO OTHERS  )
      ORDER BY 1 NULLS FIRST, 2 NULLS FIRST, 3 NULLS FIRST
