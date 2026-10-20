SELECT coalesce(min(f1)+5,11) AS m FROM test1
      GROUP BY f1
     HAVING max(m+5)<10
