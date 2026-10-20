SELECT rowid FROM t3 WHERE (a, b, c) IS ($a, $b, $c) 
        ORDER BY +rowid
