SELECT a FROM t2
      WHERE b=1081
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR b=1004
         OR (g='gfedcba' AND f GLOB 'nopqr*')
         OR ((a BETWEEN 29 AND 31) AND a!=30)
         OR b=660
         OR b=957
         OR b=869
