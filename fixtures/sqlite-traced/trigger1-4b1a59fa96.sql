CREATE TRIGGER tr1 AFTER UPDATE ON sqlite_master BEGIN
       SELECT * FROM sqlite_master;
    END;
