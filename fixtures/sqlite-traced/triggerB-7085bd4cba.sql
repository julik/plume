CREATE TRIGGER tz AFTER UPDATE ON x BEGIN
       SELECT dlo.x; -- Unrecognized name
    END;
