WITH RECURSIVE c(x,v) AS (
    VALUES(0,'1')
    UNION ALL
    SELECT x+1, decimal_mul(v,'2') FROM c WHERE x+1<=971
  ) INSERT INTO pow2(x,v) SELECT x, v FROM c;
