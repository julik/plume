SELECT x.a,y.a FROM t2249a x CROSS JOIN t2249a y
       WHERE y.a='hello' OR x.a=y.a
