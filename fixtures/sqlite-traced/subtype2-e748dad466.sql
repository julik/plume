SELECT 
  json_group_object(
      'key',
      (SELECT CAST(json(0) AS TEXT)
       FROM (SELECT 1 AS k)
       WHERE k = 1
       ORDER BY k)
  ) AS q1,
  json_group_object(
       'key',
      (SELECT CAST(json(0) AS TEXT)
       FROM (SELECT 1 AS k)
       WHERE NOT (NOT (k = 1))
       ORDER BY k)
  ) AS q2;
