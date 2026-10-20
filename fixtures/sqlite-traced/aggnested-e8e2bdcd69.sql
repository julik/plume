SELECT * FROM t1 WHERE EXISTS(
    SELECT 1 FROM t2 WHERE (
      SELECT COUNT(*) FROM (
        SELECT 1 WHERE true
        UNION ALL
        SELECT SUM(c1)
      )
    )
  );
