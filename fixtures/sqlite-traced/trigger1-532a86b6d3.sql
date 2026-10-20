CREATE TRIGGER trig UPDATE ON no_such_table BEGIN
       SELECT * from sqlite_master;
     END;
