CREATE VIEW v1 AS
    SELECT c16 AS a, *, counter(1) AS x FROM t1
    UNION ALL
    SELECT c17 AS a, *, counter(1) AS x FROM t1
    UNION ALL
    SELECT c18 AS a, *, counter(1) AS x FROM t1
    UNION ALL
    SELECT c19 AS a, *, counter(1) AS x FROM t1;
