SELECT (SELECT group_concat(a || ',' || b, ',') FROM t0 WHERE rowid = -1) 
           IS 
           (SELECT group_concat(a || ',' || b, ',') FROM s1 WHERE rowid = -1)
