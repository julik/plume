SELECT a FROM t2
      WHERE ((a BETWEEN 1 AND 3) AND a!=2)
         OR b=792
         OR b=803
         OR b=36
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
