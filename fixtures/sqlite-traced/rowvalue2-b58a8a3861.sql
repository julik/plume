SELECT rowid FROM t4 WHERE (a > NULL) OR (a == NULL AND b > 0) OR (a == NULL AND b == 0 AND c > 0) ORDER BY +rowid
