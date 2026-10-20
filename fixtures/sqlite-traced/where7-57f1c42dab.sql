SELECT a FROM t2
      WHERE ((a BETWEEN 71 AND 73) AND a!=72)
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR a=100
         OR a=29
         OR c=15015
         OR a=87
         OR (g='gfedcba' AND f GLOB 'klmno*')
