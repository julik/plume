SELECT min(f1) AS m FROM test1 GROUP BY f1 HAVING max(m+5)<10
