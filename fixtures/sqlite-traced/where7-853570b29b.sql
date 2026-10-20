SELECT a FROM t2
      WHERE b=1070
         OR b=1078
         OR ((a BETWEEN 11 AND 13) AND a!=12)
         OR c=12012
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
         OR b=319
         OR c=5005
         OR 1000000<b
         OR b=1037
         OR b=234
