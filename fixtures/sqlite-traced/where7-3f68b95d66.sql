SELECT a FROM t2
      WHERE ((a BETWEEN 68 AND 70) AND a!=69)
         OR (d>=71.0 AND d<72.0 AND d NOT NULL)
         OR ((a BETWEEN 94 AND 96) AND a!=95)
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR b=619
         OR c=6006
         OR b=91
         OR b=297
         OR b=165
