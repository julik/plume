SELECT (SELECT count(*) FROM t1, t2 WHERE a=e AND x=f), e, f, '|'
    FROM t3
   ORDER BY rowid;
