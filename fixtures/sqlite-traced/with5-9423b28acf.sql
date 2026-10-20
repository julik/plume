WITH RECURSIVE tt(ii) AS (
      VALUES(1) UNION ALL SELECT id FROM tree, tt WHERE parent=ii ORDER BY id
  )
  SELECT * FROM tt ORDER BY ii;
