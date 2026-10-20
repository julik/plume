WITH RECURSIVE c(x) AS (
     VALUES(1)
     UNION ALL
     SELECT x+1 FROM c WHERE x<1040
  )
  SELECT 
    count(*),
    sum(length(replace(printf('abc%.*cxyz',x,'m'),'m','nnnn'))-(6+x*4))
  FROM c;
