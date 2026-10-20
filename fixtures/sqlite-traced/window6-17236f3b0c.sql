WITH t1(a,b) AS ( VALUES(1, 2), (2, 3), (3, 4) )
    SELECT nth_value(b, NULL) OVER (ORDER BY a) FROM t1
