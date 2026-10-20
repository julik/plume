SELECT b, x, quote(y) FROM t1 RIGHT JOIN t2 ON a=x AND y GLOB 'A*'
  ORDER BY x, y
