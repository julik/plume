CREATE TRIGGER tr2 INSERT ON t1 BEGIN
            SELECT * from sqlite_master; END;
