SELECT a FROM t2
      WHERE ((a BETWEEN 28 AND 30) AND a!=29)
         OR b=737
         OR ((a BETWEEN 80 AND 82) AND a!=81)
         OR b=979
         OR a=36
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
         OR (d>=50.0 AND d<51.0 AND d NOT NULL)
         OR a=55
         OR (g='fedcbaz' AND f GLOB 'rstuv*')
