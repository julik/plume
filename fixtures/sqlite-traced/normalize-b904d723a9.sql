SELECT x FROM t1 WHERE x IN ([x] IS NOT NULL, NULL, 1, 'a', "b", x'00');
