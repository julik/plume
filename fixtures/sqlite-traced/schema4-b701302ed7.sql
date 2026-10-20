CREATE TRIGGER t1 AFTER INSERT ON tbl BEGIN
    INSERT INTO log VALUES('after insert', new.a, new.b);
  END;
