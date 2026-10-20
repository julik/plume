SELECT a FROM t2
      WHERE b=179
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR b=509
         OR ((a BETWEEN 58 AND 60) AND a!=59)
         OR (d>=49.0 AND d<50.0 AND d NOT NULL)
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR f='bcdefghij'
