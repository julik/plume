SELECT a FROM t2
      WHERE c=30030
         OR a=18
         OR ((a BETWEEN 44 AND 46) AND a!=45)
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR b=11
         OR (g='qponmlk' AND f GLOB 'opqrs*')
         OR a=52
         OR (g='utsrqpo' AND f GLOB 'wxyza*')
         OR a=13
         OR (d>=65.0 AND d<66.0 AND d NOT NULL)
