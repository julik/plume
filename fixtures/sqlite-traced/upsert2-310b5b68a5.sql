CREATE TRIGGER r2 AFTER INSERT ON t1 BEGIN
    INSERT INTO record(x,y)
        VALUES('after-insert',printf('%d,%d,%d',new.a,new.b,new.c));
  END;
