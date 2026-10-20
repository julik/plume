CREATE TRIGGER t16r AFTER UPDATE ON t16b BEGIN
     UPDATE t16a SET (a,b,c)=(SELECT new.x,new.x+1,new.x+2);
  END;
