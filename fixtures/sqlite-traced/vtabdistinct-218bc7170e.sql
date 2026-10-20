SELECT distinct vn, ix FROM qpvtab(3)
   WHERE +vn IN ('sqlite3_vtab_distinct','nOrderBy');
