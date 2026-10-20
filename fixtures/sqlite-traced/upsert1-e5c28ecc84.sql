CREATE TRIGGER r1 BEFORE UPDATE ON t2 BEGIN
    SELECT raise(ABORT,'Incorrect old.y value passed to trigger!')
     WHERE old.y != new.y;
    /* ^^^ This trigger will fire and cause the ABORT if the problem has
    ** not been fixed, or if there is a regression. */
  END;
