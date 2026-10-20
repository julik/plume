CREATE TRIGGER tr AFTER INSERT ON t3 BEGIN
    INSERT INTO t3 SELECT new.c+1 WHERE new.c<5;
    INSERT INTO t2 SELECT new.c*10000+xx.a*100+yy.a
                     FROM t1 AS xx, t1 AS yy
                    WHERE xx.a IN (1,2,3,4)
                      AND yy.a IN (2,3,4,5);
  END;
