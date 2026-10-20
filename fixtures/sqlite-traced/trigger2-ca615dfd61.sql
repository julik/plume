CREATE TRIGGER the_trigger AFTER UPDATE  ON tbl BEGIN INSERT INTO tbl VALUES(500, new.b * 10, 700); 
    UPDATE tbl SET c = old.c; 
    DELETE FROM log; END;
