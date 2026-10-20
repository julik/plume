SELECT a FROM t2
      WHERE b=352
         OR b=278
         OR ((a BETWEEN 90 AND 92) AND a!=91)
         OR ((a BETWEEN 28 AND 30) AND a!=29)
         OR b=660
         OR a=18
         OR a=34
         OR b=132
         OR (g='gfedcba' AND f GLOB 'lmnop*')
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR c=18018
