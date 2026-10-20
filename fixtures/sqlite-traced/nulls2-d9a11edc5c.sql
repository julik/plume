SELECT rowid FROM t2 WHERE (d, e, f) IN (
        SELECT a, b, c FROM t1
    )
