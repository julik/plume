SELECT a FROM t2
      WHERE b=553
         OR a=16
         OR ((a BETWEEN 80 AND 82) AND a!=81)
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (g='wvutsrq' AND f GLOB 'lmnop*')
         OR f='zabcdefgh'
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR (g='xwvutsr' AND f GLOB 'fghij*')
