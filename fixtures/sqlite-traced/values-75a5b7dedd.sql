WITH VVV AS 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 SELECT (SELECT column1 FROM VVV)
