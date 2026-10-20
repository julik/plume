CREATE TRIGGER tr1 BEFORE UPDATE ON t1 BEGIN
      INSERT INTO log VALUES(old.z || '->' || new.z);
    END;
