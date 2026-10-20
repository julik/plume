SELECT * FROM 
  ( VALUES('a', 'b'), ('c', 'd'), (123, NULL) )
 eXCEPT SELECT 'a', 'b'
