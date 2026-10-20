SELECT a FROM t2
      WHERE c=31031
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR b=256
         OR ((a BETWEEN 77 AND 79) AND a!=78)
         OR (g='qponmlk' AND f GLOB 'mnopq*')
         OR b=715
         OR b=212
         OR b=99
         OR c=29029
