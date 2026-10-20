CREATE TRIGGER r4 AFTER UPDATE ON t1 BEGIN
    INSERT INTO record(x,y)
        VALUES('after-update',printf('%d,%d,%d/%d,%d,%d',
                                      old.a,old.b,old.c,new.a,new.b,new.c));
  END;
