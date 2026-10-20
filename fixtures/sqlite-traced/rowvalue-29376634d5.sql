CREATE TRIGGER t16c1 AFTER INSERT ON t16c BEGIN
    UPDATE t16c SET (c, d) = (SELECT 'A', 'B'), (e, b) = (SELECT 'C', 'D')
      WHERE a = new.a-1;
  END;
