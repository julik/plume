CREATE TRIGGER t1_a_u AFTER UPDATE ON t1 BEGIN
    INSERT INTO log VALUES(old.b || ' -> ' || new.b || ' c = ' || changes() );
  END;
