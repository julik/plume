CREATE TEMP TRIGGER AFTER INSERT ON x1 BEGIN
    UPDATE x1 SET two=new.three || "new" WHERE one=new.one||"";
  END;
