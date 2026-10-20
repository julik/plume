SELECT a FROM t2
      WHERE c=4004
         OR b=718
         OR (g='qponmlk' AND f GLOB 'opqrs*')
         OR a=50
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
         OR b=363
         OR (g='rqponml' AND f GLOB 'ijklm*')
         OR b=1023
