SELECT quote(x), quote(a), quote(b), 'x'
    FROM t2 LEFT JOIN t1 ON a=x AND b in (null,0,10);
