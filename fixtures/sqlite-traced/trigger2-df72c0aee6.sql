CREATE TRIGGER the_trigger AFTER DELETE  ON tbl BEGIN INSERT INTO log select * from tbl; END;
