SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR a=92
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR f='fghijklmn'
         OR a=100
         OR b=209
         OR c=9009
         OR ((a BETWEEN 52 AND 54) AND a!=53)
         OR a=73
         OR b=902
