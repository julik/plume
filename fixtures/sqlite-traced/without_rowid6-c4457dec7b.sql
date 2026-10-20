WITH RECURSIVE
    c(i) AS (VALUES(1) UNION ALL SELECT i+1 FROM c WHERE i<1000)
  INSERT INTO t1(a,b,c,d,e) SELECT i, i+1000, printf('x%dy',i), 0, 0 FROM c;
