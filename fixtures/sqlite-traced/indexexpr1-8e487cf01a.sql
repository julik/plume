-- The use of the "k" alias in the WHERE clause is technically
  -- illegal, but SQLite allows it for historical reasons.  In this
  -- test and the next, verify that "k" can be used by the t5ax index
  SELECT substr(a,4,3) AS k FROM cnt, t5 WHERE k=printf('%03d',x);
