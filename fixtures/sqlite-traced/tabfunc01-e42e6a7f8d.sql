SELECT * FROM (
    SELECT * FROM generate_series(1,10)
    UNION ALL
    SELECT * FROM generate_series(101,104)
  ) LIMIT -1 OFFSET 5;
