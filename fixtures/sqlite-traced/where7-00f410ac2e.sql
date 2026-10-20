SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR c=14014
         OR c=33033
         OR a=89
         OR b=770
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
         OR a=35
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
         OR b=253
         OR c=14014
