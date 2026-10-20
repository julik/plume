WITH t(id, parent) AS (
  SELECT CAST(1 AS INT), CAST(NULL AS INT)
  UNION ALL
  SELECT 2, NULL
  UNION ALL
  SELECT 3, 1
  UNION ALL
  SELECT 4, 1
  UNION ALL
  SELECT 5, 2
  UNION ALL
  SELECT 6, 2
  ), q AS (
  SELECT t.*, ROW_NUMBER() OVER (ORDER BY t.id) AS rn
    FROM t
   WHERE parent IS NULL
   UNION ALL
  SELECT t.*, ROW_NUMBER() OVER (ORDER BY t.id) AS rn
    FROM q
    JOIN t
      ON t.parent = q.id
  )
  SELECT *
    FROM q;
