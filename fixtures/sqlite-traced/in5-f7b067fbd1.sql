SELECT count(*) FROM t3 WHERE b IN (SELECT          a FROM t3 LIMIT 5);
