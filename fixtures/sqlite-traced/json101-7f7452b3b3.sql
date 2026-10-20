WITH c(x) AS (VALUES(1),(2.0),(NULL),('three'))
  SELECT json_group_array(x) FROM c;
