CREATE TRIGGER au_tbl AFTER UPDATE ON tbl BEGIN
      UPDATE OR IGNORE tbl SET a = new.a, c = 10;
    END;
