SELECT json_group_object(
      'key',
      (SELECT json(0)
       FROM (SELECT 1 AS k)
       WHERE k = 1
       ORDER BY k)
  );
