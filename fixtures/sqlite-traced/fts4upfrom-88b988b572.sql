CREATE TRIGGER tr2 INSTEAD OF UPDATE ON ft BEGIN
      UPDATE real SET rowid=new.rowid, a=new.a, b=new.b, c=new.c 
      WHERE rowid=old.rowid;
    END;
