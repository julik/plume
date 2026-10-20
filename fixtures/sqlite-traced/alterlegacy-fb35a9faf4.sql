CREATE TRIGGER temp.t9t AFTER INSERT ON temp.t9 BEGIN
    INSERT INTO t10 VALUES(new.a, new.b, new.c);
  END;
