EXPLAIN QUERY PLAN
  SELECT rowid FROM t1 WHERE substr(a,b,3)<='and' ORDER BY +rowid;
