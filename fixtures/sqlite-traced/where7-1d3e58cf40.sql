SELECT a FROM t2
      WHERE a=98
         OR (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR a=47
         OR c=24024
         OR a=27
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
