CREATE TRIGGER t3c0 AFTER UPDATE ON t3
         WHEN old.c0!=new.c0 BEGIN
          INSERT INTO t3_changes VALUES(0, old.c0, new.c0);
      END
