SELECT t1.a, t2.b
    FROM t1 CROSS JOIN t2
    WHERE t1.a = t2.b
    AND t2.b COLLATE NOCASE = 'Hello';
