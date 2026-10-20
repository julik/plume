CREATE VIEW v2 AS SELECT
    sum(b) OVER win,
    min(b) OVER win,
    max(b) OVER win
  FROM t3
  WINDOW win AS (ORDER BY c);
