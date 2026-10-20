-- Different case for the table name in the trigger.
    CREATE TRIGGER trig1 AFTER INSERT ON T6 BEGIN
      SELECT trigfunc('trig1', new.a, new.b, new.c);
    END;
