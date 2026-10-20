SELECT a FROM t2
      WHERE b=1026
         OR b=454
         OR ((a BETWEEN 92 AND 94) AND a!=93)
         OR b=179
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR f='qrstuvwxy'
