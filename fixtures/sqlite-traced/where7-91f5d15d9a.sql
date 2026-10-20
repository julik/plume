SELECT a FROM t2
      WHERE ((a BETWEEN 71 AND 73) AND a!=72)
         OR a=20
         OR (g='vutsrqp' AND f GLOB 'rstuv*')
         OR (g='jihgfed' AND f GLOB 'xyzab*')
         OR b=1004
         OR b=77
         OR b=927
         OR a=99
         OR (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
