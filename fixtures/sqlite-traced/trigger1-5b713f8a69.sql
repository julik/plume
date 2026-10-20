CREATE TRIGGER r1 AFTER INSERT ON t1 BEGIN
    SELECT raise(abort,format('attempt to insert %d where is not a power of 2',new.a))
     WHERE (new.a & (new.a-1))!=0;
  END;
