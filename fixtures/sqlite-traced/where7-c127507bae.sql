SELECT a FROM t2
      WHERE b=1081
         OR ((a BETWEEN 19 AND 21) AND a!=20)
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR ((a BETWEEN 73 AND 75) AND a!=74)
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR a=6
