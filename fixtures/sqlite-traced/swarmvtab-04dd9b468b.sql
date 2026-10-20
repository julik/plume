SELECT (SELECT group_concat(a || ',' || b, ',') FROM t0 WHERE rowid BETWEEN 20 AND 100) 
           IS 
           (SELECT group_concat(a || ',' || b, ',') FROM s1 WHERE rowid BETWEEN 20 AND 100)
