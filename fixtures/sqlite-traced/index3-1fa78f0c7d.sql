WITH RECURSIVE c(x) AS (VALUES(1) UNION SELECT x+1 FROM c WHERE x<30)
    INSERT INTO t1(a,b,c,d,e) 
      SELECT x, printf('ab%03xxy',x), x, x, x FROM c;
