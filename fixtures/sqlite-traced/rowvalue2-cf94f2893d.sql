SELECT rowid FROM t4 WHERE (a > 0) OR (a == 0 AND b > 0) OR (a == 0 AND b == 0 AND c >= 0) ORDER BY +rowid
