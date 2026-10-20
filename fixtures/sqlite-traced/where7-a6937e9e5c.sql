SELECT a FROM t2
      WHERE a=85
         OR (d>=33.0 AND d<34.0 AND d NOT NULL)
         OR b=212
         OR ((a BETWEEN 25 AND 27) AND a!=26)
         OR b=36
         OR b=231
         OR b=1048
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR (g='ponmlkj' AND f GLOB 'rstuv*')
         OR c=19019
