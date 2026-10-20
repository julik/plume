SELECT a FROM t2
      WHERE (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR a=55
         OR f='efghijklm'
         OR a=8
         OR a=80
         OR (d>=34.0 AND d<35.0 AND d NOT NULL)
         OR b=256
         OR (d>=72.0 AND d<73.0 AND d NOT NULL)
