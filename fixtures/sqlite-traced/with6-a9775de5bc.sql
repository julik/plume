WITH c(x) AS (VALUES(0),(1))
  SELECT c2.x + 100*(SELECT sum(x+1) FROM c WHERE c.x<=c2.x)
    FROM c AS c2 WHERE c2.x<10;
