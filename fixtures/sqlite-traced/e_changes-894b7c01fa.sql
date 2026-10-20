CREATE TRIGGER t1_i BEFORE INSERT ON t1 BEGIN
    INSERT INTO t2 VALUES(new.a, new.b), (new.a, new.b);
    INSERT INTO log VALUES('t2->' || changes());
  END;
