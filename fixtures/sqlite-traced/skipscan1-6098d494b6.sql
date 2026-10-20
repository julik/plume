SELECT DISTINCT a
    FROM t1
   WHERE a = b
     AND a = 3
     AND b IN (1,3,2,4)
     AND b >= 0
     AND a <= 10;
