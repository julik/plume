WITH c(x,y,z) AS (VALUES('a',4,5),('b',3,6),('c',2,7),('c',1,8))
  SELECT group_concat(DISTINCT x ORDER BY y, z) FROM c;
