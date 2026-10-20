WITH c(x,y) AS (VALUES
    ('{a:3}', 3),
    ('[1,1]', 1),
    ('[4,4]', 4),
    ('{x:2}', 2))
  SELECT json_group_array(json(x) ORDER BY y) FROM c;
