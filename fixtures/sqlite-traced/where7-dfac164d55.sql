SELECT a FROM t2
      WHERE (g='rqponml' AND f GLOB 'ijklm*')
         OR a=99
         OR a=100
         OR b=429
         OR b=682
         OR b=495
         OR f='efghijklm'
         OR a=10
         OR f='mnopqrstu'
         OR b=946
         OR (d>=95.0 AND d<96.0 AND d NOT NULL)
