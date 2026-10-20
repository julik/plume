CREATE TRIGGER v1 AFTER UPDATE ON tbl BEGIN
    INSERT INTO log VALUES('after update', new.a, new.b);
  END;
