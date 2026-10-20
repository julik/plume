EXPLAIN QUERY PLAN
    SELECT a.x, b.x
      FROM t12 AS a JOIN t12 AS b ON a.y=b.x
     WHERE (b.x=$abc OR b.y=$abc);
