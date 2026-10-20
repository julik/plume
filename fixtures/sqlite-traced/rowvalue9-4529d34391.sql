SELECT d1.rowid FROM d1 WHERE a = (
      SELECT y FROM d2 where d2.rowid=d1.rowid
    );
