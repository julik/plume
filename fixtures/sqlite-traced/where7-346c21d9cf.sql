SELECT a FROM t2
      WHERE ((a BETWEEN 46 AND 48) AND a!=47)
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR b=905
         OR b=176
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR b=561
         OR c=8008
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
         OR b=935
         OR c=1001
