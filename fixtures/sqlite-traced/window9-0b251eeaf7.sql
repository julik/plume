SELECT(
      SELECT x UNION 
      SELECT sum( avg((SELECT x FROM v1)) ) OVER()
      ORDER BY 1
  )
  FROM v1;
