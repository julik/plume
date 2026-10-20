SELECT a FROM t2
      WHERE a=77
         OR (g='lkjihgf' AND f GLOB 'nopqr*')
         OR (g='rqponml' AND f GLOB 'hijkl*')
         OR c=24024
         OR c=5005
