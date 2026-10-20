WITH VVV AS 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 SELECT * FROM t1 LEFT JOIN VVV ON (column1=x)
