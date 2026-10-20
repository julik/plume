SELECT count(*) FROM s1 a, s1 b, s1 c 
  WHERE a.rowid=b.rowid AND b.rowid=c.rowid;
