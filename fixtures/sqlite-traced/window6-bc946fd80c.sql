SELECT "counter", "value", RANK() OVER w AS "rank" 
  FROM "sample"
  WINDOW w AS (PARTITION BY "counter" ORDER BY "value" DESC) 
  ORDER BY "counter", RANK() OVER w
