SELECT a FROM t2
      WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
         OR b=66
         OR b=322
         OR b=465
         OR (g='gfedcba' AND f GLOB 'lmnop*')
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR (d>=7.0 AND d<8.0 AND d NOT NULL)
         OR ((a BETWEEN 77 AND 79) AND a!=78)
         OR (g='lkjihgf' AND f GLOB 'mnopq*')
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR b=454
