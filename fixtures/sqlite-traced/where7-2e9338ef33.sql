SELECT a FROM t2
      WHERE a=19
         OR (g='onmlkji' AND f GLOB 'xyzab*')
         OR b=674
         OR (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR b=355
         OR ((a BETWEEN 72 AND 74) AND a!=73)
         OR (g='qponmlk' AND f GLOB 'pqrst*')
         OR c=28028
         OR b=649
         OR (g='vutsrqp' AND f GLOB 'rstuv*')
         OR (g='srqponm' AND f GLOB 'fghij*')
