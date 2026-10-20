SELECT * FROM t1 WHERE w IN 
         (select rowid from t1 where rowid IN (-1,2,4))
      ORDER BY 1;
