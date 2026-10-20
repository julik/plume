SELECT typeof(y), EXISTS(SELECT 1 FROM t1 WHERE x=y), typeof(y)
    FROM t2
   GROUP BY y;
