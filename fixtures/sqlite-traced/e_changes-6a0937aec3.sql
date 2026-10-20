CREATE TRIGGER t2_i AFTER INSERT ON t2 BEGIN
    INSERT INTO t3 VALUES(new.a, new.b), (new.a, new.b), (new.a, new.b);
    INSERT INTO log VALUES('t3->' || changes());
  END;
