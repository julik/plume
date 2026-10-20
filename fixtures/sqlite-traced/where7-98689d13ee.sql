SELECT a FROM t2
      WHERE a=100
         OR c=11011
         OR b=297
         OR a=63
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
         OR a=76
         OR b=1026
         OR a=26
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR c=30030
