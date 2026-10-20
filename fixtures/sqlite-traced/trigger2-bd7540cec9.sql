CREATE TRIGGER the_trigger BEFORE DELETE  ON tbl BEGIN INSERT INTO log select * from tbl; END;
