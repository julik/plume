CREATE TRIGGER the_trigger AFTER INSERT  ON tbl BEGIN INSERT INTO log select * from tbl; END;
