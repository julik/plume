SELECT a, b FROM t3 WHERE 
        (a=1 AND b=(SELECT y FROM t4 WHERE x='a')) 
     OR (a=2 AND b='two')
