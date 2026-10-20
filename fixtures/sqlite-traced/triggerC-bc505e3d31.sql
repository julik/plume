SELECT count(*) FROM sqlite_master 
  GROUP BY raise(IGNORE) 
  HAVING raise(ABORT, 'msg');
