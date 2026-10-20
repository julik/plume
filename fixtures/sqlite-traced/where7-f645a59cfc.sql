SELECT a FROM t2
      WHERE ((a BETWEEN 57 AND 59) AND a!=58)
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR b=564
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR b=77
         OR (g='nmlkjih' AND f GLOB 'efghi*')
         OR b=968
         OR b=847
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR (g='lkjihgf' AND f GLOB 'opqrs*')
