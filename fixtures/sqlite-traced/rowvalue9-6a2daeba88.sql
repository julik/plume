SELECT a1.rowid FROM a1, a2 
  WHERE (coalesce(NULL,x), coalesce(NULL,y)) = (a, b)
