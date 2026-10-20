CREATE TRIGGER tr1 AFTER UPDATE OF "geom" ON "mytable" 
          WHEN OLD."fid" = NEW."fid" AND NEW."geom" IS NULL BEGIN 
      DELETE FROM rt WHERE id = OLD."fid"; 
    END;
