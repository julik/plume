CREATE VIEW v3 AS SELECT b, d, 
      max(d) OVER (PARTITION BY b),
      row_number() OVER (PARTITION BY b)
  FROM t1;
