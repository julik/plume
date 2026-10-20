SELECT a FROM t2
      WHERE (d>=68.0 AND d<69.0 AND d NOT NULL)
         OR (d>=94.0 AND d<95.0 AND d NOT NULL)
         OR b=938
         OR b=641
         OR c=17017
         OR a=82
         OR (d>=65.0 AND d<66.0 AND d NOT NULL)
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR (d>=39.0 AND d<40.0 AND d NOT NULL)
