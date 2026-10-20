SELECT a FROM t2
      WHERE b<0
         OR b=352
         OR b=517
         OR (g='fedcbaz' AND f GLOB 'tuvwx*')
         OR ((a BETWEEN 12 AND 14) AND a!=13)
         OR b=1012
         OR ((a BETWEEN 11 AND 13) AND a!=12)
