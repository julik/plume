CREATE TRIGGER ty AFTER INSERT ON x BEGIN
       SELECT wen.x; -- Unrecognized name
    END;
