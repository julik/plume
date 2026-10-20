SELECT x, CASE (SELECT b,c FROM t1 WHERE a=y)
            WHEN (1,2) THEN 'aleph'
            WHEN (2,3) THEN 'bet'
            WHEN (3,4) THEN 'gimel'
            ELSE '-' END,
         '|'
    FROM t2
   ORDER BY +x;
