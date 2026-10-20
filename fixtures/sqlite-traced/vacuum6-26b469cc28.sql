WITH s(i) AS (
        SELECT 1 UNION ALL SELECT i+1 FROM s WHERE i<100
    )
    INSERT INTO t1 SELECT i, randomblob($sz) FROM s;
