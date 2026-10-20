CREATE TRIGGER the_trigger BEFORE INSERT  ON tbl BEGIN INSERT INTO log select * from tbl; END;
