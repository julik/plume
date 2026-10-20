SELECT a FROM t2
      WHERE ((a BETWEEN 38 AND 40) AND a!=39)
         OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
         OR b=429
         OR f='jklmnopqr'
         OR (d>=48.0 AND d<49.0 AND d NOT NULL)
         OR ((a BETWEEN 77 AND 79) AND a!=78)
