WITH c(a) AS (SELECT tx FROM t1 UNION SELECT 'y') SELECT affinity(a) FROM c;
