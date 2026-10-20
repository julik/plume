SELECT "counter", "value", SUM("value") OVER 
  (ORDER BY "id" ROWS 2 PRECEDING) 
    FROM "sample" 
  ORDER BY "id"
