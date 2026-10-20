CREATE TRIGGER v2ins INSTEAD OF INSERT ON v2 BEGIN
    INSERT INTO t1(a,b,c,d) VALUES(new.a, new.b, new.c, new.d);
  END;
