WITH c(x,y) AS (VALUES(1,1),(2,2),(3,3),(3,4),(3,5),(3,6))
  SELECT sum(DISTINCT x ORDER BY y) FROM c;
