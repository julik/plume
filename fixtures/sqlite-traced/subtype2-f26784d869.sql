SELECT subtype (
      (SELECT json(0)
       FROM (SELECT 1 AS k)
       WHERE (NOT (NOT (k = 1)))
       ORDER BY k)
  );
