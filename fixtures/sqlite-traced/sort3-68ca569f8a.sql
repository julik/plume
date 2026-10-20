WITH r(x,y) AS (
        SELECT 1, randomblob(1000)
        UNION ALL
        SELECT x+1, randomblob(1000) FROM r
        LIMIT 20000
    )
    SELECT count(*), sum(length(y)) FROM r GROUP BY (x%5);
