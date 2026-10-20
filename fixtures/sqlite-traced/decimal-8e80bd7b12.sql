WITH RECURSIVE c(x,v) AS (
    VALUES(-1,'0.5')
    UNION ALL
    SELECT x-1, decimal_mul(v,'0.5') FROM c WHERE x-1>=-1075
  ) INSERT INTO pow2(x,v) SELECT x, v FROM c;
