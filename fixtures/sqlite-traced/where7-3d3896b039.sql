SELECT a FROM t2
      WHERE a=95
         OR ((a BETWEEN 72 AND 74) AND a!=73)
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR b=594
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
         OR ((a BETWEEN 53 AND 55) AND a!=54)
