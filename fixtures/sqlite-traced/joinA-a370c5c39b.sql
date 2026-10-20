SELECT a,b,c,d,t2.e,f,t3.e,t1.a
      FROM t1
           FULL JOIN t2 USING(c,d)
           FULL JOIN t3 USING(a,b,f)
           FULL JOIN t4 USING(a,c,d,f)
     WHERE t1.a!=0
    ORDER BY 1 nulls first, 3 nulls first;
