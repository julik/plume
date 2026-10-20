SELECT * FROM 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 UNION ALL SELECT * FROM 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
