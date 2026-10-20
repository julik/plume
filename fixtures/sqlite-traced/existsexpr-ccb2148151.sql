explain query plan 
  SELECT * FROM tx2 WHERE EXISTS (
    SELECT 1 FROM tx1 WHERE (a COLLATE nocase)=x AND b=y
  )
