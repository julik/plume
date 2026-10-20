SELECT (
    SELECT max(y) OVER( ORDER BY (SELECT x FROM (SELECT sum(y) AS x FROM t1)))
  )
  FROM t3;
