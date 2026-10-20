SELECT (SELECT column1 FROM 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
)
