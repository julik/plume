SELECT a FROM t2
      WHERE b=399
         OR ((a BETWEEN 9 AND 11) AND a!=10)
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR a=10
         OR b=1026
