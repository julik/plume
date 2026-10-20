SELECT a FROM t2
      WHERE ((a BETWEEN 98 AND 100) AND a!=99)
         OR b=110
         OR ((a BETWEEN 38 AND 40) AND a!=39)
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
         OR b=484
         OR (d>=82.0 AND d<83.0 AND d NOT NULL)
