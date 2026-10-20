SELECT *, '|' FROM (SELECT x FROM t1) AS y, generate_series(1,y.x)
  ORDER BY 1, 2;
