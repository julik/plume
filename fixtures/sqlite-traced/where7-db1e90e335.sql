SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
         OR b=451
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR ((a BETWEEN 97 AND 99) AND a!=98)
         OR a=84
