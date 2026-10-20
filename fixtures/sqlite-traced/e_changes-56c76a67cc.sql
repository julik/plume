CREATE TRIGGER AFTER UPDATE ON t1 BEGIN
    INSERT INTO t2 VALUES('a'), ('b'), ('c');
    SELECT my_changes('trigger');
  END;
