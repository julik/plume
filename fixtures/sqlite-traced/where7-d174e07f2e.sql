SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
         OR c=32032
         OR f='opqrstuvw'
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR ((a BETWEEN 49 AND 51) AND a!=50)
         OR b=993
