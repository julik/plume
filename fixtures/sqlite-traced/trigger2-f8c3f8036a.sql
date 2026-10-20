CREATE TRIGGER the_trigger AFTER DELETE  ON tbl BEGIN INSERT INTO tbl VALUES(500, '' * 10, 700); 
    UPDATE tbl SET c = old.c; 
    DELETE FROM log; END;
