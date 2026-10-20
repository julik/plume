INSERT INTO t14 VALUES
     (1000, CAST(printf('%.*c', 1000, 'a') AS BLOB)),
     (5000, CAST(printf('%.*c', 5000, 'a') AS BLOB));
