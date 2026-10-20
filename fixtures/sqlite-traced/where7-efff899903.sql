SELECT a FROM t2
      WHERE c=5005
         OR (d>=2.0 AND d<3.0 AND d NOT NULL)
         OR ((a BETWEEN 36 AND 38) AND a!=37)
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
