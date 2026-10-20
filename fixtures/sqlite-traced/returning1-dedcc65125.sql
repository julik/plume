CREATE TRIGGER tr2 INSTEAD OF UPDATE ON t1 BEGIN
    INSERT INTO log VALUES('update', new.rowid, new.a, new.b);
  END;
