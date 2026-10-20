SELECT count(),
       NULLIF(name,'abc') AS name
    FROM t63
   GROUP BY lower(name);
