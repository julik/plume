SELECT a FROM t2
      WHERE c=18018
         OR a=94
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR b=1012
         OR a=3
         OR d>1e10
         OR b=905
         OR b=1089
