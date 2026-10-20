SELECT if(a,a,y),
         SUM(1)                              AS t1,
         SUM(CASE WHEN b->>'x'=1 THEN 1 END) AS t2,
         SUM(c)                              AS t3,
         SUM(CASE WHEN b->>'x'=1 THEN c END) AS t4
    FROM t2 CROSS JOIN t1
   WHERE d BETWEEN 0 and 10
   GROUP BY a;
