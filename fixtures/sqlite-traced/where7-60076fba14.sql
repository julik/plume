SELECT a FROM t2
      WHERE ((a BETWEEN 13 AND 15) AND a!=14)
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR f='mnopqrstu'
         OR (g='fedcbaz' AND f GLOB 'tuvwx*')
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR a=38
         OR c=26026
