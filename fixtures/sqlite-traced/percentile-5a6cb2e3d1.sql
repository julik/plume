SELECT name, class, cost,
    percentile(cost,   0) OVER w1 AS 'P0',
    percentile(cost,  25) OVER w1 AS 'P1',
    percentile(cost,  50) OVER w1 AS 'P2',
    percentile(cost,  75) OVER w1 AS 'P3',
    percentile(cost, 100) OVER w1 AS 'P4'
  FROM user
  WINDOW w1 AS (PARTITION BY class)
  ORDER BY class, cost;
