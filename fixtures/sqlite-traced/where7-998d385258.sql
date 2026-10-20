SELECT a FROM t2
      WHERE ((a BETWEEN 53 AND 55) AND a!=54)
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR c=4004
         OR a=95
         OR b=707
         OR f='vwxyzabcd'
         OR b=286
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR b=693
         OR ((a BETWEEN 6 AND 8) AND a!=7)
