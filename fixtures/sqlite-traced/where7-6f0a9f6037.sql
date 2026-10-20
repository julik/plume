SELECT a FROM t2
      WHERE f='zabcdefgh'
         OR (g='xwvutsr' AND f GLOB 'defgh*')
         OR a=54
         OR b=770
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR a=81
         OR b=190
         OR a=2
