SELECT * FROM t4 
  WHERE substr(a, 2) = 'abc' COLLATE NOCASE
  ORDER BY substr(a, 2), b;
