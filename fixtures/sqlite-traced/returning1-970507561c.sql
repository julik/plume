CREATE TRIGGER tr1 INSTEAD OF INSERT ON t1 BEGIN
    INSERT INTO log VALUES('insert', new.rowid, new.a, new.b);
  END;
