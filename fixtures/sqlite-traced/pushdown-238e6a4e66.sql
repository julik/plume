SELECT *
    FROM t1 JOIN t2 ON null RIGHT JOIN t3 ON true
          LEFT JOIN (t4 JOIN t5 ON d+1=e) ON d=4
   WHERE e>0;
