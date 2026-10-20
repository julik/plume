SELECT a FROM t2
      WHERE (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR a=13
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR b=322
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR b=377
         OR f='cdefghijk'
         OR b=286
         OR ((a BETWEEN 61 AND 63) AND a!=62)
