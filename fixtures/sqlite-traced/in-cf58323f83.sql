CREATE VIEW t5 AS
    SELECT 1 AS b
     WHERE (SELECT count(0=NOT+a COLLATE NOCASE IN (SELECT 0))
              FROM t4
             GROUP BY a);
