SELECT a FROM t2
      WHERE b=330
         OR a=73
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR b=828
         OR b=363
         OR (g='rqponml' AND f GLOB 'lmnop*')
