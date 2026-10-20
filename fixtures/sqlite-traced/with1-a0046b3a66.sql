WITH t(id) AS (
    VALUES(2)
    UNION ALL
    SELECT i FROM tree, t WHERE p = id AND p IN (SELECT id FROM t)
  ) 
  SELECT id FROM t;
