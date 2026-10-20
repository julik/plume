SELECT a FROM t2
      WHERE ((a BETWEEN 57 AND 59) AND a!=58)
         OR b=1078
         OR ((a BETWEEN 21 AND 23) AND a!=22)
         OR (g='mlkjihg' AND f GLOB 'ijklm*')
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
         OR b=429
