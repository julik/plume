SELECT n, length(c), length(CAST(c AS TEXT))
    FROM t14 ORDER BY +n;
