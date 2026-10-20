SELECT * FROM t1 RIGHT JOIN 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 ON (column1=x)
