SELECT a FROM t2
      WHERE ((a BETWEEN 14 AND 16) AND a!=15)
         OR b=847
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR b=583
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR (d>=26.0 AND d<27.0 AND d NOT NULL)
         OR ((a BETWEEN 40 AND 42) AND a!=41)
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR b=938
