CREATE TRIGGER tr2 AFTER UPDATE ON t1 BEGIN
      INSERT INTO log VALUES(old.y || '->' || new.y);
    END;
