SELECT a FROM t2
      WHERE b=883
         OR c=32032
         OR f='fghijklmn'
         OR ((a BETWEEN 49 AND 51) AND a!=50)
         OR b=421
         OR b=803
         OR c=4004
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
