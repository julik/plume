SELECT (
    SELECT a FROM (
      SELECT y AS a FROM (
        SELECT z AS y FROM (SELECT sum(x) AS z) AS t2 
      ) 
    )
  ) FROM t1;
