SELECT a FROM t2
      WHERE b=693
         OR f='fghijklmn'
         OR (g='rqponml' AND f GLOB 'hijkl*')
         OR (g='qponmlk' AND f GLOB 'nopqr*')
         OR ((a BETWEEN 71 AND 73) AND a!=72)
         OR a=96
