SELECT a FROM t2
      WHERE f='bcdefghij'
         OR ((a BETWEEN 40 AND 42) AND a!=41)
         OR (g='srqponm' AND f GLOB 'ghijk*')
         OR b=157
         OR b=267
         OR c=34034
