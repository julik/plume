SELECT raise(ABORT, 'msg') FROM sqlite_master 
  UNION SELECT 1 
  ORDER BY raise(IGNORE);
