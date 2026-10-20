EXPLAIN QUERY PLAN
    SELECT * FROM t1
     WHERE (a=1 OR a=2)
       AND (b=3 OR b=4)
       AND (d>=5 AND d<=5)
       AND ((e>=7 AND e<=7) OR (f>=8 AND f<=8))
       AND g>0;
