SELECT count(*) FROM t1, t0 
  WHERE (t0.c0 = t1.term) AND (t1.term COLLATE NOCASE = 'ABC');
