SELECT a, b FROM (
    SELECT a, b FROM t1_a   UNION ALL
    SELECT c, d FROM t1_b   UNION ALL
    SELECT e, f FROM t1_c
  ) ORDER BY a
