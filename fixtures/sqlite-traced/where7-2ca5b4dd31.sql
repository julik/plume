SELECT a FROM t2
      WHERE b=201
         OR b=682
         OR b=443
         OR b=836
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
         OR ((a BETWEEN 51 AND 53) AND a!=52)
         OR b=110
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
