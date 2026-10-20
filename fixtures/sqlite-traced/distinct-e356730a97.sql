EXPLAIN  /* Technically, it would be possible to detect that 
            ** is a no-op in cases like the following. But SQLite does not
            ** do so. */
            SELECT  t1.rowid FROM t1, t2 WHERE t1.rowid=t2.rowid
