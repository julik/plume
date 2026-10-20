CREATE TRIGGER v1r1 INSTEAD OF UPDATE OF c ON v1 BEGIN
    UPDATE t1 SET c=new.c WHERE (a,b,c,d) IS (old.a,old.b,old.c,old.d);
    UPDATE t3 SET c=new.c WHERE (c,y) IS (old.c,old.y);
  END;
