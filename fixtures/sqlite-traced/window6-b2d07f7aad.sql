WITH t1(a,b) AS ( VALUES(1, 2), (2, 3), (3, 4) )
    SELECT nth_value(b, 8.5) OVER (ORDER BY a) FROM t1
