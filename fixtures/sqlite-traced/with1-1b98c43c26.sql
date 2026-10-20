CREATE TRIGGER tr1 AFTER INSERT ON t1 BEGIN
    INSERT INTO log
        WITH map(k,v) AS (VALUES(1,'cte1'),(2,'cte2'))
        SELECT
          new.k,
          (SELECT v FROM map WHERE k=new.k),
          (SELECT v FROM main.map WHERE k=new.k);
  END;
