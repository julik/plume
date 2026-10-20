SELECT a FROM t2
      WHERE (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR ((a BETWEEN 11 AND 13) AND a!=12)
         OR ((a BETWEEN 74 AND 76) AND a!=75)
         OR ((a BETWEEN 39 AND 41) AND a!=40)
         OR b=242
         OR ((a BETWEEN 32 AND 34) AND a!=33)
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR b=300
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR ((a BETWEEN 93 AND 95) AND a!=94)
