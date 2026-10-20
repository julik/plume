SELECT a FROM t2
      WHERE b=916
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR b=1048
         OR c=6006
         OR b=762
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR b=751
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
