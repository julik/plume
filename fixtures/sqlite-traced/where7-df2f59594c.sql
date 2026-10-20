SELECT a FROM t2
      WHERE b=223
         OR a=14
         OR ((a BETWEEN 74 AND 76) AND a!=75)
         OR (g='qponmlk' AND f GLOB 'pqrst*')
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR b=539
         OR (d>=48.0 AND d<49.0 AND d NOT NULL)
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR a=21
