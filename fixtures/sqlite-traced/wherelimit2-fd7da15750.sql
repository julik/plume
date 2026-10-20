CREATE TRIGGER tr1 INSTEAD OF DELETE ON "v w" BEGIN
    SELECT log(old."a b", old."c d");
  END;
