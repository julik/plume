WITH s(i) AS ( VALUES(1) UNION ALL VALUES(2) )
    SELECT i, value FROM s, carray(?) WHERE i=value;
