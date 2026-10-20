SELECT a FROM t2
      WHERE b=575
         OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
         OR b=418
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR b=792
         OR b=861
         OR b=220
         OR ((a BETWEEN 89 AND 91) AND a!=90)
