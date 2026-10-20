CREATE VIEW vA AS
    SELECT * FROM v1, (
      SELECT * FROM t1 LEFT JOIN t2 ON (a=c)
    )
    UNION ALL
    SELECT * FROM v1, v2
