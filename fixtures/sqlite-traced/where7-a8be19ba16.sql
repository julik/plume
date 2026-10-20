SELECT a FROM t2
      WHERE ((a BETWEEN 47 AND 49) AND a!=48)
         OR b=517
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR (g='srqponm' AND f GLOB 'fghij*')
         OR f='defghijkl'
         OR b=707
         OR c>=34035
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR a=80
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
