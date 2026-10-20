CREATE TRIGGER the_trigger AFTER INSERT  ON tbl BEGIN INSERT INTO tbl VALUES(500, new.b * 10, 700); 
    UPDATE tbl SET c = ''; 
    DELETE FROM log; END;
