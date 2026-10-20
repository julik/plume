explain query plan 
  SELECT * FROM tx2 WHERE EXISTS (
    SELECT 1 FROM tx1 WHERE a=x AND b=y COLLATE nocase
  )
