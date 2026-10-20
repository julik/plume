SELECT b FROM f1 ORDER BY a 
       LIMIT 2 OFFSET (SELECT group_concat(b) FROM f1)
