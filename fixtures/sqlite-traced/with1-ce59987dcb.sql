WITH t(id) AS (
    SELECT i FROM tree WHERE 2 IN (SELECT id FROM t)
    UNION ALL
    SELECT i FROM tree, t WHERE p = id
  ) 
  SELECT id FROM t;
