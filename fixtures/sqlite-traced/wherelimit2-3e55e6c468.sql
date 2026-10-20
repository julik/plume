CREATE TRIGGER tr2 INSTEAD OF UPDATE ON "v w" BEGIN
    SELECT log(new."a b", new."c d");
  END;
