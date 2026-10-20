CREATE VIEW v1 AS 
      SELECT ( VALUES(a), (b) ) FROM (
        SELECT a, b FROM t1
      )
  ;
