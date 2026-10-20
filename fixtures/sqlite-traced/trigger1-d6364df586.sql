CREATE TRIGGER x AFTER UPDATE ON t1 BEGIN
   SELECT sum(b)OVER(ORDER BY (SELECT b FROM t1 AS x 
                               WHERE b IN (t1.a,127,t1.b)
                               GROUP BY b))
     FROM t1
     GROUP BY a;
  END;
