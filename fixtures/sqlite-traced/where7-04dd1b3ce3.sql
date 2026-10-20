SELECT a FROM t2
      WHERE (g='jihgfed' AND f GLOB 'zabcd*')
         OR a=18
         OR a=30
         OR ((a BETWEEN 9 AND 11) AND a!=10)
         OR ((a BETWEEN 84 AND 86) AND a!=85)
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR b=792
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR ((a BETWEEN 19 AND 21) AND a!=20)
         OR c=26026
         OR (g='rqponml' AND f GLOB 'hijkl*')
