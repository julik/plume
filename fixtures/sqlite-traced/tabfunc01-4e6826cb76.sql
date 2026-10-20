SELECT x, y, value
  FROM (t1 RIGHT JOIN generate_series(t2.y,5) AS value) JOIN t2;
