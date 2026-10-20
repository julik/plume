CREATE TRIGGER tr3 BEFORE DELETE ON t1 BEGIN
    UPDATE t1 SET b=coalesce(old.b,old.c) FROM main.link WHERE a=t AND old.a=f;
  END;
