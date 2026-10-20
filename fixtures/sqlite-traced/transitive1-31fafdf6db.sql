SELECT * FROM t1 CROSS JOIN t2 
  WHERE t1.x = t2.y
    AND (t1.x COLLATE nocase = 'abc')
