SELECT c, c IN ( 
    SELECT row_number() OVER () FROM ( SELECT 1 FROM t1 WHERE x=c )
  ) FROM t2
