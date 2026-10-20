SELECT * FROM t1 JOIN t1 USING(a,b)
   WHERE ((SELECT t1.a FROM t1 AS x GROUP BY b) AND b=0)
      OR a = 10;
