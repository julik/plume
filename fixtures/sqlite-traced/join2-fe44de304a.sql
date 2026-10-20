SELECT a.x
    FROM t1 AS a
    LEFT JOIN t1 AS b ON (a.x=b.x)
    LEFT JOIN t2 AS c ON (a.x=c.x);
