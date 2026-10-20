WITH c(a) AS (SELECT null UNION SELECT tx FROM t1) SELECT affinity(a) FROM c;
