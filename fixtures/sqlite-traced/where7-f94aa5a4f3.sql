SELECT a FROM t2
      WHERE ((a BETWEEN 12 AND 14) AND a!=13)
         OR ((a BETWEEN 13 AND 15) AND a!=14)
         OR b=253
         OR ((a BETWEEN 20 AND 22) AND a!=21)
         OR b=396
         OR b=630
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR c=3003
         OR (d>=49.0 AND d<50.0 AND d NOT NULL)
