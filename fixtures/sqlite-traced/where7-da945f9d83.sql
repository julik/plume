SELECT a FROM t2
      WHERE b=597
         OR f='lmnopqrst'
         OR a=24
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR b=1023
         OR a=53
         OR a=78
         OR f='efghijklm'
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR (d>=85.0 AND d<86.0 AND d NOT NULL)
