SELECT a, count(*) FROM t0 WHERE a IN (1,2) AND c GLOB 'A' GROUP BY a;
