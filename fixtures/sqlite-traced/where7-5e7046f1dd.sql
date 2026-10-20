SELECT a FROM t2
      WHERE a=44
         OR b=55
         OR a=30
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR 1000000<b
         OR a=24
         OR b=1089
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR (g='rqponml' AND f GLOB 'hijkl*')
