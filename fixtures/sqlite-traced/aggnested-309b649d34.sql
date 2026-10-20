SELECT ( 
    SELECT min(y) + (SELECT x) FROM (
      SELECT sum(a) AS x, b AS y FROM t2
    )
  )
  FROM t1;
