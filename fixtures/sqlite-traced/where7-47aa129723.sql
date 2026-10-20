SELECT a FROM t2
      WHERE c=2002
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR ((a BETWEEN 41 AND 43) AND a!=42)
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR b=33
         OR b=817
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR (g='xwvutsr' AND f GLOB 'efghi*')
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
