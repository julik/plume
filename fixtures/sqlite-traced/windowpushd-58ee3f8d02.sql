CREATE VIEW v2 AS SELECT a, c, 
      max(c) OVER (PARTITION BY a),
      row_number() OVER ()
  FROM t1;
