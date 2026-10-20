CREATE TRIGGER t1_ad AFTER DELETE ON t1 BEGIN
    UPDATE ft SET content = 'a b c' WHERE rowid=old.x;
  END;
