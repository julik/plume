SELECT * FROM t1 RIGHT JOIN 
  ( 
  SELECT 'a' AS column1, 'b' AS column2 
  UNION ALL SELECT 'c', 'd' UNION ALL SELECT 123, NULL
  )
