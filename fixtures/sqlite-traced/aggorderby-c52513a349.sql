WITH c(x,y) AS (VALUES
    ('[4,4]', 4),
    ('{a:3}', 3),
    ('[4,4]', 4),
    ('[1,1]', 1),
    ('[4,4]', 4),
    ('{x:2}', 2))
  SELECT json_group_array(DISTINCT json(x) ORDER BY json(x)) FROM c;
