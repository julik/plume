SELECT string_agg(c, '.') OVER (PARTITION BY b ORDER BY c)
  FROM t1
