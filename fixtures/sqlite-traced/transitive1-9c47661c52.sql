SELECT * FROM t1 CROSS JOIN t2 
  WHERE (t1.x COLLATE nocase) = (t2.y COLLATE nocase) 
    AND (t2.y = 'ABC')
