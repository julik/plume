SELECT DISTINCT fts.rowid, t1.y
    FROM fts, t1
   WHERE fts MATCH 'that twice'
     AND content=x
   ORDER BY y;
