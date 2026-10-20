CREATE TRIGGER main.t16err2 AFTER INSERT ON tA BEGIN
      UPDATE main.t16 SET rowid=rowid+1;
    END;
