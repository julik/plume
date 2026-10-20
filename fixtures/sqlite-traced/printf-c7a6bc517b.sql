WITH RECURSIVE c(n,t) AS (
    VALUES(1,char(1))
    UNION ALL
    SELECT n+1, t||char(n+1) FROM c WHERE n<0x7e
  )
  SELECT hex(format('{"a":%J}',t)->>'a') FROM c WHERE n=0x7e;
