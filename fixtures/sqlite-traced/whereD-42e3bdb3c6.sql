SELECT 
    bar.Id, bar.ba, bar.bb, foo.fb
    FROM foo LEFT JOIN bar
           ON (bar.ba = 1 AND bar.bb = foo.fb)
           OR (bar.ba = 5 AND bar.bb = foo.fb);
