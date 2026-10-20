WITH c(a) AS (SELECT tx FROM t1 UNION SELECT null) SELECT affinity(a) FROM c;
