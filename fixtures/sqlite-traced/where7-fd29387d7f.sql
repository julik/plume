SELECT a FROM t2
      WHERE b=440
         OR ((a BETWEEN 3 AND 5) AND a!=4)
         OR ((a BETWEEN 44 AND 46) AND a!=45)
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
         OR a=89
         OR c=18018
         OR b=154
         OR b=506
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR a=78
         OR b=751
