SELECT 'abc' FROM (
        SELECT x FROM t6
        UNION ALL
        SELECT x FROM t6 ORDER BY 1
        UNION ALL
        SELECT x FROM t6 ORDER BY 1
        UNION ALL
        SELECT x FROM t6
    )
