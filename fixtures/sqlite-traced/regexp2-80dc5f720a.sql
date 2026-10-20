CREATE TRIGGER t3_tr1 AFTER UPDATE ON t3 BEGIN
    UPDATE t4 SET f = new.d WHERE e = old.c AND new.d REGEXP 'a.*';
  END;
