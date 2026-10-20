SELECT t1.x
    FROM fts, t1
   WHERE fts MATCH 'that twice'
     AND content=x
   ORDER BY 1;
