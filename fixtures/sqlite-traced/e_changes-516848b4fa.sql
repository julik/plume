CREATE TRIGGER v1_d INSTEAD OF DELETE ON v1 BEGIN
    INSERT INTO log VALUES('delete'), ('delete'), ('delete');
  END;
