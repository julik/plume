SELECT * FROM t1
   WHERE y = 'AB' OR (y = 'CD' AND x = 2)
  ORDER BY +x;
