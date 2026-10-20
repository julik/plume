SELECT a FROM t2
      WHERE b=355
         OR a=44
         OR b=374
         OR c=25025
         OR b=198
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR d<0.0
         OR (g='qponmlk' AND f GLOB 'pqrst*')
         OR c=9009
