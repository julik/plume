SELECT (
    SELECT (SELECT x) FROM (
      SELECT sum(a) AS x, b AS y FROM t2
      ) GROUP BY y
    )
  FROM t1;
