SELECT group_concat(CAST(b AS TEXT), '.') OVER win2
    FROM t2
    WINDOW win1 AS (PARTITION BY b%2,a ORDER BY b%10),
           win2 AS (win1 ROWS BETWEEN CURRENT ROW         AND 4 FOLLOWING)
    ORDER BY 1
