EXPLAIN 
  SELECT * FROM x1 LEFT JOIN x2 ON (a=x) WHERE 1 = coalesce(b, 1)
