SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR c=22022
         OR ((a BETWEEN 79 AND 81) AND a!=80)
         OR (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR c=25025
