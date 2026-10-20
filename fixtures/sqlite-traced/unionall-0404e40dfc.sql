CREATE TRIGGER t2_insert INSTEAD OF INSERT ON t2 BEGIN
    INSERT INTO t2_a SELECT new.k, new.v WHERE (new.k%2)==0;
    INSERT INTO t2_b SELECT new.k, new.v WHERE (new.k%2)==1;
  END;
