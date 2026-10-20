SELECT a FROM t2
      WHERE a=20
         OR ((a BETWEEN 74 AND 76) AND a!=75)
         OR b=341
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR b=814
         OR b=1026
         OR a=14
         OR a=13
         OR b=1037
         OR ((a BETWEEN 56 AND 58) AND a!=57)
