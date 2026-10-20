SELECT (SELECT group_concat(a || ',' || b, ',') FROM t0 WHERE 1) 
           IS 
           (SELECT group_concat(a || ',' || b, ',') FROM s1 WHERE 1)
