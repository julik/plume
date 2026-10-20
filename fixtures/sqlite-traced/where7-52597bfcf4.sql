SELECT a FROM t2
      WHERE ((a BETWEEN 84 AND 86) AND a!=85)
         OR b=234
         OR a=53
         OR ((a BETWEEN 20 AND 22) AND a!=21)
         OR ((a BETWEEN 27 AND 29) AND a!=28)
         OR b=319
         OR (g='qponmlk' AND f GLOB 'opqrs*')
         OR ((a BETWEEN 14 AND 16) AND a!=15)
