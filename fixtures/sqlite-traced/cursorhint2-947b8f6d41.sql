EXPLAIN 
  SELECT * FROM x1 LEFT JOIN x2 ON (a=x) WHERE coalesce(x2.b, 1)
