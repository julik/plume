WITH VVV AS 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 SELECT count(*) FROM VVV
