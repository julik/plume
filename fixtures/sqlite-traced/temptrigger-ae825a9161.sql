CREATE TEMP TRIGGER tr2 AFTER UPDATE ON aux.t1 BEGIN
    UPDATE main.t2 SET c=new.e, d=new.f;
  END;
