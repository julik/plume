SELECT a FROM t2
      WHERE ((a BETWEEN 55 AND 57) AND a!=56)
         OR (d>=85.0 AND d<86.0 AND d NOT NULL)
         OR c<=10
         OR ((a BETWEEN 75 AND 77) AND a!=76)
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
         OR b=553
         OR (g='jihgfed' AND f GLOB 'vwxyz*')
         OR b=1045
