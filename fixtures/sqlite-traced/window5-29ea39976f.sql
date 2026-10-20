SELECT sumint(a) OVER (ORDER BY rowid) FROM t1 ORDER BY rowid;
