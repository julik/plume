SELECT x,
         y IS TRUE, y IS FALSE, y is NULL,
         y IS NOT TRUE, y IS NOT FALSE, y IS NOT NULL, '|'
    FROM t1 ORDER BY x;
