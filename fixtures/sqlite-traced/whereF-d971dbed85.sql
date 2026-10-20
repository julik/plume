EXPLAIN SELECT (
    SELECT COUNT(*) FROM t2
     WHERE ( t1.b GLOB 'a*z' AND t2.bb='xyz' )
        OR ( t2.bb = t1.b )
        OR ( t2.aa = t1.a )
    )
    FROM t1;
