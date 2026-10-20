CREATE TRIGGER tr1 INSTEAD OF INSERT ON ft BEGIN
      INSERT INTO real(rowid, a, b, c) VALUES(new.rowid, new.a, new.b, new.c);
    END;
