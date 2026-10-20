WITH c(x,y) AS (VALUES(1,9),(2,null),(3,5),(4,null),(5,1))
  SELECT json_group_array(x ORDER BY y NULLS FIRST, x),
         json_group_array(x ORDER BY y NULLS LAST, x) FROM c;
