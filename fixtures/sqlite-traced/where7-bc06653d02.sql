SELECT a FROM t2
      WHERE (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR b=641
         OR ((a BETWEEN 36 AND 38) AND a!=37)
