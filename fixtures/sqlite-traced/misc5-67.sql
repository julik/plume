SELECT * FROM sqlite_master 
      UNION ALL 
      SELECT * FROM sqlite_master
      LIMIT (SELECT count(*) FROM blah);
