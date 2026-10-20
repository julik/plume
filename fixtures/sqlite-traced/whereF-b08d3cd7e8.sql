SELECT * FROM t6 WHERE 1 IN (SELECT value FROM json_each(x));
