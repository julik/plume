CREATE TABLE t3 AS
    SELECT a AS p, coalesce(y,a) AS q FROM t1 LEFT JOIN t2 ON a=x;
