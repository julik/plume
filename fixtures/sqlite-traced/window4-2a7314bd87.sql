SELECT a, count(*) OVER abc, count(*) OVER def FROM t5
  WINDOW abc AS (ORDER BY a), 
         def AS (ORDER BY a DESC)
  ORDER BY a;
