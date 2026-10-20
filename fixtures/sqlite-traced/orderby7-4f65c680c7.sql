SELECT DISTINCT t1.x
    FROM fts, t1
   WHERE fts.rowid=11
     AND content=x
   ORDER BY fts.rowid;
