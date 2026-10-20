SELECT a FROM t2
      WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR a=57
         OR b=55
         OR (d>=34.0 AND d<35.0 AND d NOT NULL)
         OR ((a BETWEEN 20 AND 22) AND a!=21)
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR ((a BETWEEN 0 AND 2) AND a!=1)
         OR ((a BETWEEN 21 AND 23) AND a!=22)
