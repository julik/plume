SELECT a FROM t2
      WHERE b=1034
         OR f='vwxyzabcd'
         OR (g='gfedcba' AND f GLOB 'nopqr*')
         OR ((a BETWEEN 57 AND 59) AND a!=58)
