CREATE TRIGGER foo_insert BEFORE INSERT ON foo BEGIN
      SELECT CASE WHEN (NOT new.bar BETWEEN 0 AND 20)
             THEN raise(rollback, 'aiieee') END;
    END;
