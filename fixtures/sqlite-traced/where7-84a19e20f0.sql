SELECT a FROM t2
      WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
         OR b=693
         OR (g='hgfedcb' AND f GLOB 'ijklm*')
         OR b=968
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR b=132
         OR f='nopqrstuv'
         OR ((a BETWEEN 28 AND 30) AND a!=29)
