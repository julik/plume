SELECT a FROM t2
      WHERE a=43
         OR ((a BETWEEN 44 AND 46) AND a!=45)
         OR a=1
         OR ((a BETWEEN 75 AND 77) AND a!=76)
         OR a=75
         OR (g='hgfedcb' AND f GLOB 'fghij*')
         OR ((a BETWEEN 59 AND 61) AND a!=60)
