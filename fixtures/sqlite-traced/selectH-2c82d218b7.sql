SELECT a FROM (
    SELECT counter(1) AS cnt, c15 AS a, *, c62 AS b FROM t1
    UNION ALL
    SELECT counter(1) AS cnt, c16 AS a, *, c61 AS b FROM t1
    ORDER BY b
  );
