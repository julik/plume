CREATE TRIGGER trd AFTER DELETE ON t1 BEGIN
      INSERT INTO log VALUES(old.a || old.b || (SELECT count(*) FROM t1));
    END;
