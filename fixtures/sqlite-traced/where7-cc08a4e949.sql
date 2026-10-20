SELECT a FROM t2
      WHERE c=1001
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR a=49
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR c=33033
         OR (g='utsrqpo' AND f GLOB 'stuvw*')
         OR (d>=81.0 AND d<82.0 AND d NOT NULL)
         OR g IS NULL
         OR b=220
         OR (d>=70.0 AND d<71.0 AND d NOT NULL)
