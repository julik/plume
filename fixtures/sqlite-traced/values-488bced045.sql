SELECT * FROM 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 INTERSECT SELECT * FROM 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
