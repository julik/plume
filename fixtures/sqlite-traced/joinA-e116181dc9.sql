SELECT a,b,c,d,t2.e,f,t3.e
      FROM t1
           INNER JOIN t2 USING(c,d)
           INNER JOIN t3 USING(a,b,f)
           INNER JOIN t4 USING(a,c,d,f)
    ORDER BY 1 nulls first, 3 nulls first;
