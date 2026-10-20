CREATE TRIGGER r1 BEFORE INSERT ON t1 BEGIN
    INSERT INTO record(x,y)
        VALUES('before-insert',format('%d,%d,%d',new.a,new.b,new.c));
  END;
