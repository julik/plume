CREATE TRIGGER t2_d BEFORE DELETE ON t2 BEGIN
    DELETE FROM t3 WHERE a=old.a AND b=old.b;
    INSERT INTO log VALUES('t3->' || changes());
  END;
