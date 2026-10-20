SELECT rowid FROM t3 WHERE (a, b, c) == (
          SELECT a, b, c FROM t3 WHERE w = $w
        )
        ORDER BY +rowid
