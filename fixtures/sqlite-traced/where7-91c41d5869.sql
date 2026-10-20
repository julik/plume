SELECT a FROM t2
      WHERE (d>=84.0 AND d<85.0 AND d NOT NULL)
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR ((a BETWEEN 5 AND 7) AND a!=6)
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR b=1078
         OR b=198
         OR (d>=67.0 AND d<68.0 AND d NOT NULL)
         OR b=55
         OR b=517
         OR b=740
