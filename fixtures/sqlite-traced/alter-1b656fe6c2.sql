CREATE TEMP TRIGGER trig2 AFTER UPDATE ON tbl2 BEGIN
      SELECT trigfunc('trig2', new.a, new.b, new.c);
    END;
