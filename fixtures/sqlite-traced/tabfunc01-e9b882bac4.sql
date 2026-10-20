SELECT value
      FROM json_each(t0.c0), t0 RIGHT JOIN (SELECT 1)
      WHERE t0.c0 != 400
