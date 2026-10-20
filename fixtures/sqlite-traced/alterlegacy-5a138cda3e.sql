CREATE TEMP TRIGGER tr AFTER INSERT ON aux.t1 BEGIN
    SELECT trigger(new.a, new.b, new.c);
  END;
