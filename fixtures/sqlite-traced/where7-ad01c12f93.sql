SELECT a FROM t2
      WHERE (d>=37.0 AND d<38.0 AND d NOT NULL)
         OR b=1004
         OR (g='qponmlk' AND f GLOB 'pqrst*')
         OR g IS NULL
