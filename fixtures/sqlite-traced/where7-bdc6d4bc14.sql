SELECT a FROM t2
      WHERE ((a BETWEEN 44 AND 46) AND a!=45)
         OR a=53
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'uvwxy*')
         OR b=594
         OR b=80
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR (d>=49.0 AND d<50.0 AND d NOT NULL)
         OR d>1e10
