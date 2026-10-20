SELECT a FROM t2
      WHERE a=74
         OR a=50
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR ((a BETWEEN 16 AND 18) AND a!=17)
         OR c=21021
         OR ((a BETWEEN 82 AND 84) AND a!=83)
