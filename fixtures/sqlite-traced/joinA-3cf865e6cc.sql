SELECT a,b,c,d,t2.e,f,t3.e
      FROM t1
           LEFT JOIN t2 USING(c,d)
           LEFT JOIN t3 USING(a,b,f)
           LEFT JOIN t4 USING(a,c,d,f)
    ORDER BY 1 nulls first, 3 nulls first;
