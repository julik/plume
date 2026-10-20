SELECT DISTINCT c44 FROM (
    SELECT c0 AS a, *, counter(1) FROM t1
    UNION ALL
    SELECT c1 AS a, *, counter(1) FROM t1
  ) WHERE c60=60;
