CREATE TRIGGER t1_d AFTER DELETE ON t1 BEGIN
    DELETE FROM t2 WHERE a=old.a AND b=old.b;
    INSERT INTO log VALUES('t2->' || changes());
  END;
