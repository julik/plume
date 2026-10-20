SELECT x.a || CASE WHEN x.b==y.b THEN '==' ELSE '<>' END || y.a
    FROM t2 AS x, t2 AS y
   ORDER BY +x.a, +x.b;
