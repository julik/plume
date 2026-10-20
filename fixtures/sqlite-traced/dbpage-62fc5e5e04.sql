INSERT INTO saved_content(x) 
     SELECT data FROM sqlite_dbpage WHERE schema='aux1' AND pgno=2;
