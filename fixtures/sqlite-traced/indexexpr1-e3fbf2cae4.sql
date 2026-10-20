WITH RECURSIVE c(x) AS (VALUES(1) UNION SELECT x+1 FROM c WHERE x<30)
  INSERT INTO t3(a,b,c)
    SELECT x, printf('ab%04xyz',x), random() FROM c;
