SELECT max( 
    (SELECT json( b ) FROM t1 WHERE t1.b=o.b)
  ) FROM t1 AS o;
