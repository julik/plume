SELECT count(*) FROM ( 
  SELECT a, b FROM t1 AS o NOT INDEXED 
  WHERE NOT EXISTS (SELECT 1 FROM t1 WHERE +a=o.a AND +b=o.b AND +c=o.c)
 )
