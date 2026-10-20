CREATE TRIGGER t2_u BEFORE UPDATE ON t2 BEGIN
    UPDATE t3 SET b=new.b WHERE a=old.a;
    INSERT INTO log VALUES('t3->' || changes());
  END;
