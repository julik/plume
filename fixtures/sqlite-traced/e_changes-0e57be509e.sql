WITH rows(i, j) AS (
        SELECT 1, 1 UNION ALL SELECT i+1, j+i FROM rows WHERE i<10
    )
    INSERT INTO t1 SELECT * FROM rows
