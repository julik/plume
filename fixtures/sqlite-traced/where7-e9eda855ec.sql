SELECT a FROM t2
      WHERE b=506
         OR ((a BETWEEN 20 AND 22) AND a!=21)
         OR (g='hgfedcb' AND f GLOB 'ijklm*')
         OR b=429
         OR b=275
