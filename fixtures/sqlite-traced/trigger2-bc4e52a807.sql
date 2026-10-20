CREATE TRIGGER the_trigger BEFORE UPDATE  ON tbl BEGIN INSERT INTO log select * from tbl; END;
