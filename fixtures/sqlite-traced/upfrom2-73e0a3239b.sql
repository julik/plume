CREATE TRIGGER w1tr INSTEAD OF UPDATE ON w1 BEGIN
      UPDATE o1 SET y=new.y, z=new.z WHERE w=new.w AND x=new.x;
    END;
