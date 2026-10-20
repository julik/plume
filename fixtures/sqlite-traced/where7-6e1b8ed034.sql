SELECT a FROM t2
      WHERE ((a BETWEEN 11 AND 13) AND a!=12)
         OR b=253
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR b=286
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
