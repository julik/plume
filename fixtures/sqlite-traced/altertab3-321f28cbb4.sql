SELECT a, b FROM t1
    INTERSECT 
    SELECT b,a FROM t1
    ORDER BY b IN (
        SELECT a UNION SELECT b
        FROM t1
        ORDER BY b COLLATE nocase
        );
