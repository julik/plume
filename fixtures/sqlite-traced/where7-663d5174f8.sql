SELECT a FROM t2
      WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR c=5005
         OR ((a BETWEEN 50 AND 52) AND a!=51)
         OR a=93
         OR c=24024
         OR b=619
         OR b=234
         OR b=55
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR (d>=56.0 AND d<57.0 AND d NOT NULL)
