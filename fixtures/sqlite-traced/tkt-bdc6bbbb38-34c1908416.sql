SELECT snippet(t2,'[',']') FROM t2 WHERE t2 MATCH 'a AND d OR b' 
    ORDER BY docid ASC
