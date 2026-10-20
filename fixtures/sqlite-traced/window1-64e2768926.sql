SELECT 
    sum(a) OVER ( ORDER BY a ) 
  FROM t1 
  ORDER BY (SELECT sum(a) FROM t2)
