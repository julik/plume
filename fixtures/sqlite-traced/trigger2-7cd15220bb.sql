CREATE TRIGGER the_trigger AFTER UPDATE  ON tbl BEGIN INSERT INTO log select * from tbl; END;
