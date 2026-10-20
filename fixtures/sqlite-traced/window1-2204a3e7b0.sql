CREATE VIEW v1 AS SELECT
    sum(b) OVER (ORDER BY c),
    min(b) OVER (ORDER BY c),
    max(b) OVER (ORDER BY c)
  FROM t3;
