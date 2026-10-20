CREATE TRIGGER t1_u AFTER UPDATE ON t1 BEGIN
    UPDATE t2 SET b=new.b WHERE a=old.a;
    INSERT INTO log VALUES('t2->' || changes());
  END;
