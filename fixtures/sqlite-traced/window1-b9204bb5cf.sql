SELECT quote(group_concat(x) OVER (
      ORDER BY y RANGE BETWEEN 1 FOLLOWING AND 2 FOLLOWING
    )) FROM (SELECT 'abc' AS x, 1 AS y);
