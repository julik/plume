SELECT a FROM t2
      WHERE b=531
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR ((a BETWEEN 95 AND 97) AND a!=96)
         OR ((a BETWEEN 32 AND 34) AND a!=33)
         OR b=44
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
         OR (g='onmlkji' AND f GLOB 'xyzab*')
         OR b=707
         OR b=322
