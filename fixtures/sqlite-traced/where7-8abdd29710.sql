SELECT a FROM t2
      WHERE ((a BETWEEN 27 AND 29) AND a!=28)
         OR (g='gfedcba' AND f GLOB 'nopqr*')
