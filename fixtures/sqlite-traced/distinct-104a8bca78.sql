EXPLAIN  /* Technically, it would be possible to detect that DISTINCT
            ** is a no-op in cases like the following. But SQLite does not
            ** do so. */
            SELECT DISTINCT t1.rowid FROM t1, t2 WHERE t1.rowid=t2.rowid
