SELECT a FROM t2
      WHERE (g='xwvutsr' AND f GLOB 'defgh*')
         OR a=22
         OR a=26
         OR a=81
         OR a=53
         OR ((a BETWEEN 92 AND 94) AND a!=93)
         OR c=30030
         OR (g='wvutsrq' AND f GLOB 'ijklm*')
         OR a=82
         OR b=594
