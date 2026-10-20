SELECT a FROM t2
      WHERE b=1034
         OR f='lmnopqrst'
         OR (g='qponmlk' AND f GLOB 'mnopq*')
