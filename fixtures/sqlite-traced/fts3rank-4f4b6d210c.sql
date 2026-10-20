SELECT * FROM t1 WHERE t1 MATCH 'one' 
  ORDER BY rank(matchinfo(t1), 1.0, 1.0) DESC, rowid
