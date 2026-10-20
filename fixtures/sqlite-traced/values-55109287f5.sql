WITH VVV AS 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 SELECT * FROM VVV eXCEPT SELECT 'a', 'b'
