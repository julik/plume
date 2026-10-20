CREATE TRIGGER r3 BEFORE UPDATE ON t1 BEGIN
    INSERT INTO record(x,y)
        VALUES('before-update',format('%d,%d,%d/%d,%d,%d',
                                      old.a,old.b,old.c,new.a,new.b,new.c));
  END;
