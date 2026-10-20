SELECT a FROM t2
      WHERE f='stuvwxyza'
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR ((a BETWEEN 1 AND 3) AND a!=2)
         OR b=1037
         OR f='zabcdefgh'
         OR (g='gfedcba' AND f GLOB 'mnopq*')
