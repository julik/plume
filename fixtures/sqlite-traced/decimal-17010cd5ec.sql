WITH RECURSIVE c(x,y,z) AS (
    VALUES(0,'1','1')
    UNION ALL
    SELECT x+1, decimal_mul(y,'2'), decimal_mul(z,'0.5')
      FROM c WHERE x<32
  )
  SELECT count(*) FROM c WHERE decimal_mul(y,z)='1';
