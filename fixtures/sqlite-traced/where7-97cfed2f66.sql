SELECT a FROM t2
      WHERE ((a BETWEEN 74 AND 76) AND a!=75)
         OR ((a BETWEEN 94 AND 96) AND a!=95)
         OR b=451
         OR (g='lkjihgf' AND f GLOB 'opqrs*')
