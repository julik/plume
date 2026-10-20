CREATE TEMPORARY TABLE tab (
    prim DATE PRIMARY KEY,
    a INTEGER,
    comp INTEGER AS (a),
    b INTEGER,
    x INTEGER
  );
