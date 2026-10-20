CREATE VIEW v3 AS
    SELECT a, b, c FROM t1
    UNION ALL
    SELECT a, b, 'xyz' FROM t2;
