SELECT pgno, schema, substr(data,1,6)
    FROM sqlite_dbpage, x3
   WHERE sqlite_dbpage.schema=x3.y AND sqlite_dbpage.pgno=x3.z
   ORDER BY x3.x;
