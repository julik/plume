SELECT a FROM t2
      WHERE (g='ponmlkj' AND f GLOB 'stuvw*')
         OR ((a BETWEEN 71 AND 73) AND a!=72)
         OR a=7
         OR (g='qponmlk' AND f GLOB 'nopqr*')
         OR (g='srqponm' AND f GLOB 'ghijk*')
         OR ((a BETWEEN 33 AND 35) AND a!=34)
