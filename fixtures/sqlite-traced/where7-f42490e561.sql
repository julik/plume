SELECT a FROM t2
      WHERE b=212
         OR b=121
         OR c=2002
         OR ((a BETWEEN 84 AND 86) AND a!=85)
         OR (g='jihgfed' AND f GLOB 'xyzab*')
