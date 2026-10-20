CREATE TRIGGER tv_del INSTEAD OF DELETE ON tv
    BEGIN
      DELETE FROM t1 WHERE rowid=old.r;
      DELETE FROM t2 WHERE rowid=old.r;
    END;
