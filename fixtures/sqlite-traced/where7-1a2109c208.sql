SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'ghijk*')
         OR c=24024
         OR a=98
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR a=5
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (g='rqponml' AND f GLOB 'klmno*')
         OR f='pqrstuvwx'
         OR f='bcdefghij'
         OR b=1001
         OR ((a BETWEEN 77 AND 79) AND a!=78)
