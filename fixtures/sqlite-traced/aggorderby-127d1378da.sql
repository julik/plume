WITH c(x) AS (VALUES(1),(NULL),(2.5),(NULL),('three'))
  SELECT json_group_array(x ORDER BY x NULLS FIRST),
         json_group_array(x ORDER BY x NULLS LAST) FROM c;
