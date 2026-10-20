WITH x1(o, n) AS (
        VALUES(1, 11) UNION ALL
        VALUES(2, 12) UNION ALL
        VALUES(3, 13) UNION ALL
        VALUES(4, 14)
    )
    SELECT ft.rowid, a, b, c, o, n FROM ft, x1 WHERE ft.rowid = o;
