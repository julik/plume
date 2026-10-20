SELECT a, quote(c) FROM t0 WHERE a IN (1,2) AND c GLOB 'A' ORDER BY a;
