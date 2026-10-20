WITH c(x) AS (
    VALUES(1)
    UNION
    SELECT x+1 FROM (carray NATURAL FULL JOIN carray(t1.b)), t1, c
  )
  SELECT * FROM c;
