SELECT c, f(d,c,d,c,d) FROM t7
  UNION ALL
  SELECT a, b FROM t6 
  ORDER BY 1,2
