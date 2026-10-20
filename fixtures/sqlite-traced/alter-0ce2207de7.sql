CREATE TEMP TRIGGER trig1 AFTER INSERT ON tbl1 BEGIN
      SELECT trigfunc('trig1', new.a, new.b, new.c);
    END;
