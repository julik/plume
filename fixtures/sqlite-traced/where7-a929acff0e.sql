SELECT a FROM t2
      WHERE ((a BETWEEN 60 AND 62) AND a!=61)
         OR a=28
         OR b=443
         OR b=363
         OR (d>=28.0 AND d<29.0 AND d NOT NULL)
         OR a=60
         OR b=80
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
         OR b=616
