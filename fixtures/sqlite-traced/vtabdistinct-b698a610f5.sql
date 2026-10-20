SELECT vn, ix FROM qpvtab
   GROUP BY vn
  HAVING vn='sqlite3_vtab_distinct';
