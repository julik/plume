CREATE TRIGGER t16c1 AFTER UPDATE ON t16c WHEN new.a>1 BEGIN
    UPDATE t16c SET (e, d) = (
      SELECT b, c FROM t16c WHERE a = new.a-1
    ), (c, b) = (
      SELECT d, e FROM t16c WHERE a = new.a-1
    ) WHERE a = new.a-1;
  END;
