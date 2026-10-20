SELECT avg(b) FROM t1 
    UNION ALL 
  SELECT min(c) OVER () FROM t2 
  ORDER BY nosuchcolumn;
