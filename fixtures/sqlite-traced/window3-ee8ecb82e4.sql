SELECT group_concat(CAST(b AS TEXT), '.') OVER win2
    FROM t2
    WINDOW win1 AS (PARTITION BY b%2,a ORDER BY b%10),
           win2 AS (win1 RANGE BETWEEN CURRENT ROW         AND CURRENT ROW)
    ORDER BY 1
