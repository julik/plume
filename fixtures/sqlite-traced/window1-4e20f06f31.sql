SELECT y, y+1, y+2 FROM (
    SELECT c IN (
      SELECT (row_number() OVER()) FROM t1
    ) AS y FROM t2
  );
