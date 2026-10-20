SELECT count(*) FROM t1, t2 WHERE (
    t2.rowid = +t1.rowid OR (t2.f2 = t1.f1 AND t1.f1!=-1)
  )
