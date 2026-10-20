WITH x1(o, n) AS (
        VALUES(1, 11) UNION ALL
        VALUES(2, 12) UNION ALL
        VALUES(3, 13) UNION ALL
        VALUES(4, 14)
    )
    UPDATE ft SET rowid = n FROM x1 WHERE ft.rowid = o;
