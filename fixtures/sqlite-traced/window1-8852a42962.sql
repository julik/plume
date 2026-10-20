SELECT a, 
    count() OVER (ORDER BY a DESC),
    string_agg(a, '.') OVER (ORDER BY a DESC) 
  FROM t2 ORDER BY a DESC
