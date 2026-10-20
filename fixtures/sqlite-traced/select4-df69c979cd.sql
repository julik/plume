SELECT x, y FROM (
    SELECT a AS x, sum(b) AS y FROM t1 GROUP BY a LIMIT 3
    UNION
    SELECT 98 AS x, 99 AS y
  ) AS w WHERE y>=20
  ORDER BY +x;
