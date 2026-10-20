SELECT a FROM t2
      WHERE b=685
         OR a=86
         OR c=17017
         OR ((a BETWEEN 85 AND 87) AND a!=86)
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR a=80
         OR b=773
