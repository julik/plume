SELECT * FROM t1 ORDER BY rank(matchinfo(t1), 1.0, 1.0) DESC, rowid
