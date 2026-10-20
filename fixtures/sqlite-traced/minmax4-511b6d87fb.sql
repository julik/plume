CREATE VIEW v0(c0, c1) AS 
      SELECT t0.c1, t0.c0 FROM t0 WHERE CAST(t0.rowid AS INT) = 1;
