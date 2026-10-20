SELECT a FROM t2
      WHERE ((a BETWEEN 43 AND 45) AND a!=44)
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR f='fghijklmn'
         OR (g='rqponml' AND f GLOB 'klmno*')
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR a=74
         OR ((a BETWEEN 7 AND 9) AND a!=8)
