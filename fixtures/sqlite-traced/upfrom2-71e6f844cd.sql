CREATE TRIGGER v1tr INSTEAD OF UPDATE ON v1 BEGIN
      UPDATE t1 SET y=new.y, z=new.z WHERE x=new.x;
    END;
