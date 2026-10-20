SELECT a FROM t2
      WHERE b=806
         OR (g='rqponml' AND f GLOB 'hijkl*')
         OR b=795
         OR ((a BETWEEN 99 AND 101) AND a!=100)
         OR ((a BETWEEN 21 AND 23) AND a!=22)
         OR ((a BETWEEN 86 AND 88) AND a!=87)
         OR c=23023
         OR (d>=99.0 AND d<100.0 AND d NOT NULL)
