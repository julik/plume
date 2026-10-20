SELECT a FROM t2
      WHERE b=872
         OR b=267
         OR b=814
         OR b=99
         OR c<=10
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR b=44
         OR f='zabcdefgh'
         OR b=979
         OR (g='rqponml' AND f GLOB 'hijkl*')
