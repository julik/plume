WITH c(x,y) AS (VALUES(1,'a'),(2,'B'),(3,'c'),(4,'D'))
  SELECT group_concat(x ORDER BY y COLLATE nocase),
         group_concat(x ORDER BY y COLLATE binary) FROM c;
