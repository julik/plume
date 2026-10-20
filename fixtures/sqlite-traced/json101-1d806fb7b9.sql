WITH c(x,y) AS (VALUES('a',1),('b',2.0),('c',NULL),(NULL,'three'),('e','four'))
  SELECT json_group_object(x,y) FROM c;
