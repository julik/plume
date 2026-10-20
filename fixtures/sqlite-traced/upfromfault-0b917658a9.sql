CREATE TRIGGER t1_update INSTEAD OF UPDATE ON t1 BEGIN
      INSERT INTO log VALUES(old.z || '->' || new.z);
      UPDATE real SET y=new.y, z=new.z WHERE x=old.x;
    END;
