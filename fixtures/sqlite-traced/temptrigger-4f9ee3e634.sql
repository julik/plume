CREATE TEMP TRIGGER tr0 AFTER INSERT ON db0.tbl BEGIN
        INSERT INTO db1.tbl VALUES(new.b, new.c, new.a);
      END;
