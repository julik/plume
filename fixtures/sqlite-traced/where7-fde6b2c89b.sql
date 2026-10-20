SELECT a FROM t2
      WHERE ((a BETWEEN 98 AND 100) AND a!=99)
         OR ((a BETWEEN 51 AND 53) AND a!=52)
         OR a=18
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (d>=94.0 AND d<95.0 AND d NOT NULL)
         OR 1000000<b
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
