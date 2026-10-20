WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<100)
  INSERT INTO t1(a,b,c,d)
    SELECT x%10, x/10, x, printf('xyz%dabc',x) FROM c;
