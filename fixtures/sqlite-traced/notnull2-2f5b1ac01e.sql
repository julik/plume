SELECT *, '/'
  FROM (
      SELECT NULL val FROM (SELECT 1)
      UNION ALL
      SELECT 'missing' FROM (SELECT 1)
  ) a
  LEFT JOIN (SELECT 1)
      ON a.val IS NULL;
