SELECT a FROM t2
      WHERE ((a BETWEEN 74 AND 76) AND a!=75)
         OR ((a BETWEEN 1 AND 3) AND a!=2)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
         OR (g='mlkjihg' AND f GLOB 'klmno*')
         OR b=135
         OR a=28
         OR ((a BETWEEN 1 AND 3) AND a!=2)
         OR b=737
