SELECT (
    SELECT y FROM (
      SELECT z AS y FROM (SELECT sum(x) AS z) AS t2 
    ) 
  ) FROM t1;
