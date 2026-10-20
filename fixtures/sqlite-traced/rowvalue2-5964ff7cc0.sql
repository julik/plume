SELECT rowid FROM t4 WHERE (a < 0) OR (a == 0 AND b < NULL) OR (a == 0 AND b == NULL AND c <= 0) ORDER BY +rowid
